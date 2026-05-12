# sync_skills_from_inner.sh
# Generalized inner → outer skills/ sync. Auto-discovers what needs syncing.
#
# Behavior:
#   - DRIFTED files (common but content differs)   → overwrite with backup
#   - INNER-ONLY files (new in inner, not outer)   → create on outer
#   - OUTER-ONLY files (orphans in outer)          → REPORT ONLY, never delete
#
# Pre-flight gates: layout markers, outer repo clean in skills/.
# Per-file atomic write, .bak.<TS> for overwrites, post-sync hash verify.
# Single commit on outer, references inner HEAD. Does NOT push.
# Idempotent: exits clean if nothing needs syncing.

set -u

INNER=~/TavernOS/tavernos
OUTER=~/TavernOS/tavernos-skills
TS=$(date +%Y%m%d_%H%M%S)

echo "=== skills sync (inner → outer) ==="
echo "Inner: $INNER/skills/"
echo "Outer: $OUTER/skills/"
echo "TS:    $TS"
echo

# ============================================================
# Phase 1: pre-flight
# ============================================================
echo "--- Phase 1: pre-flight ---"

for m in config.py norm.py routing.py agents skills; do
  if [ ! -e "$INNER/$m" ]; then
    echo "ABORT: inner marker missing: $INNER/$m"
    exit 2
  fi
done
if [ ! -d "$OUTER/skills" ]; then
  echo "ABORT: outer marker missing: $OUTER/skills/"
  exit 2
fi
echo "  layout markers: OK"

cd "$OUTER" || { echo "ABORT: cannot cd $OUTER"; exit 2; }
if [ -n "$(git status --porcelain skills/)" ]; then
  echo "ABORT: outer repo has uncommitted changes in skills/:"
  git status --porcelain skills/
  exit 2
fi
echo "  outer skills/ clean: OK"
echo

# ============================================================
# Phase 2: discovery
# ============================================================
echo "--- Phase 2: discover drift ---"

INNER_FILES=$(cd "$INNER/skills" && ls *.skill.md 2>/dev/null | sort)
OUTER_FILES=$(cd "$OUTER/skills" && ls *.skill.md 2>/dev/null | sort)

OUTER_ONLY=$(comm -13 <(echo "$INNER_FILES") <(echo "$OUTER_FILES"))
INNER_ONLY=$(comm -23 <(echo "$INNER_FILES") <(echo "$OUTER_FILES"))
COMMON=$(comm -12 <(echo "$INNER_FILES") <(echo "$OUTER_FILES"))

# Initialize arrays (set -u safety)
DRIFTED=()
INNER_NEW=()

# Drift on common files (hash compare)
while IFS= read -r f; do
  [ -z "$f" ] && continue
  ih=$(shasum -a 256 "$INNER/skills/$f" | awk '{print $1}')
  oh=$(shasum -a 256 "$OUTER/skills/$f" | awk '{print $1}')
  [ "$ih" != "$oh" ] && DRIFTED+=("$f")
done <<< "$COMMON"

# Inner-only files (additions to mirror)
while IFS= read -r f; do
  [ -z "$f" ] && continue
  INNER_NEW+=("$f")
done <<< "$INNER_ONLY"

N_OUTER_ONLY=$(echo -n "$OUTER_ONLY" | grep -c . || true)
N_DRIFTED=${#DRIFTED[@]}
N_INNER_NEW=${#INNER_NEW[@]}
TOTAL=$((N_DRIFTED + N_INNER_NEW))

echo "  drifted (existing, will overwrite): $N_DRIFTED"
echo "  inner-only (new, will create):      $N_INNER_NEW"
echo "  outer-only (orphans, REPORT ONLY):  $N_OUTER_ONLY"

if [ $N_OUTER_ONLY -gt 0 ]; then
  echo "  outer-only files:"
  echo "$OUTER_ONLY" | sed 's/^/    /'
  echo "  (these will NOT be deleted; review manually if intentional removals)"
fi

if [ $TOTAL -eq 0 ]; then
  echo
  echo "Nothing to sync. Skills in sync."
  exit 0
fi
echo

# ============================================================
# Phase 3: backup + atomic sync
# ============================================================
echo "--- Phase 3: backup + atomic sync ---"
SYNCED=0

if [ $N_DRIFTED -gt 0 ]; then
  for f in "${DRIFTED[@]}"; do
    inner_path="$INNER/skills/$f"
    outer_path="$OUTER/skills/$f"
    backup_path="$outer_path.bak.$TS"
    tmp_path="$outer_path.tmp.$$"

    cp "$outer_path" "$backup_path" \
      || { echo "ABORT: backup failed for $f"; exit 3; }
    cp "$inner_path" "$tmp_path" \
      || { echo "ABORT: tmp write failed for $f"; rm -f "$tmp_path"; exit 3; }
    mv "$tmp_path" "$outer_path" \
      || { echo "ABORT: atomic rename failed for $f"; rm -f "$tmp_path"; exit 3; }

    ih=$(shasum -a 256 "$inner_path" | awk '{print $1}')
    oh=$(shasum -a 256 "$outer_path" | awk '{print $1}')
    if [ "$ih" != "$oh" ]; then
      echo "ABORT: post-sync hash mismatch on $f. Restoring backup."
      cp "$backup_path" "$outer_path"
      exit 3
    fi
    SYNCED=$((SYNCED+1))
  done
fi

if [ $N_INNER_NEW -gt 0 ]; then
  for f in "${INNER_NEW[@]}"; do
    inner_path="$INNER/skills/$f"
    outer_path="$OUTER/skills/$f"
    tmp_path="$outer_path.tmp.$$"

    # No backup needed — outer file doesn't exist
    cp "$inner_path" "$tmp_path" \
      || { echo "ABORT: tmp write failed for new $f"; rm -f "$tmp_path"; exit 3; }
    mv "$tmp_path" "$outer_path" \
      || { echo "ABORT: atomic rename failed for new $f"; rm -f "$tmp_path"; exit 3; }

    ih=$(shasum -a 256 "$inner_path" | awk '{print $1}')
    oh=$(shasum -a 256 "$outer_path" | awk '{print $1}')
    if [ "$ih" != "$oh" ]; then
      echo "ABORT: post-create hash mismatch on $f. Removing partial outer file."
      rm -f "$outer_path"
      exit 3
    fi
    SYNCED=$((SYNCED+1))
  done
fi
echo "  synced and hash-verified: $SYNCED/$TOTAL"
echo

# ============================================================
# Phase 4: commit
# ============================================================
echo "--- Phase 4: outer repo commit ---"
INNER_HEAD=$(cd "$INNER" && git rev-parse HEAD)
INNER_HEAD_SHORT=$(cd "$INNER" && git rev-parse --short HEAD)

git add skills/
STAGED=$(git diff --cached --name-only | wc -l | tr -d ' ')
if [ $STAGED -ne $TOTAL ]; then
  echo "ABORT: expected $TOTAL staged files, got $STAGED."
  echo "Staged files:"
  git diff --cached --name-only | sed 's/^/    /'
  echo "If .bak.* or .tmp.* appear above, outer .gitignore is missing"
  echo "patterns. Aborting commit; backups left in place for recovery."
  exit 4
fi

# Build commit message body
DRIFTED_LIST=""
if [ $N_DRIFTED -gt 0 ]; then
  DRIFTED_LIST=$(printf '  %s\n' "${DRIFTED[@]}")
fi
INNER_NEW_LIST=""
if [ $N_INNER_NEW -gt 0 ]; then
  INNER_NEW_LIST=$(printf '  %s\n' "${INNER_NEW[@]}")
fi

BODY="Resolves drift between inner skills/ and outer skills/.
Now matches inner HEAD $INNER_HEAD.
"
if [ -n "$DRIFTED_LIST" ]; then
  BODY+="
Drifted (overwritten):
$DRIFTED_LIST"
fi
if [ -n "$INNER_NEW_LIST" ]; then
  BODY+="
New (created on outer):
$INNER_NEW_LIST"
fi
BODY+="
Per-file backups (overwrites only) at .bak.$TS.
Post-sync hash-verified against inner."

git commit -m "skills: sync $TOTAL file(s) from inner $INNER_HEAD_SHORT

$BODY" \
  || { echo "ABORT: git commit failed"; exit 4; }

echo
echo "=== DONE ==="
echo "Synced:     $TOTAL files ($N_DRIFTED drifted, $N_INNER_NEW new)"
echo "Outer HEAD: $(git rev-parse --short HEAD)"
echo "Inner HEAD: $INNER_HEAD_SHORT"
echo
echo "Next manual steps:"
echo "  1. Inspect:  cd $OUTER && git show HEAD --stat"
echo "  2. Push:     cd $OUTER && git push"
