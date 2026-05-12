# check_skills_drift.sh
# Read-only diagnostic: detects drift between inner and outer skill registries.
#
# Scope: *.skill.md files only at skills/ root in each repo. Other files
# (README, etc) are ignored — same scope as f922ba4.
#
# Exit codes:
#   0 - in sync (no drift)
#   1 - drift detected
#   2 - environment problem
#
# Flags:
#   --summary  : single-line output (for pre-push hook consumption)

set -u

INNER=~/TavernOS/tavernos
OUTER=~/TavernOS/tavernos-skills

SUMMARY=0
for arg in "$@"; do
  case "$arg" in
    --summary) SUMMARY=1 ;;
    *) echo "unknown flag: $arg" >&2; exit 2 ;;
  esac
done

# === Layout markers ===
for m in config.py norm.py routing.py agents skills; do
  if [ ! -e "$INNER/$m" ]; then
    echo "ERROR: inner marker missing: $INNER/$m" >&2
    exit 2
  fi
done
if [ ! -d "$OUTER/skills" ]; then
  echo "ERROR: outer marker missing: $OUTER/skills/" >&2
  exit 2
fi

# === Gather inventories ===
INNER_FILES=$(cd "$INNER/skills" && ls *.skill.md 2>/dev/null | sort)
OUTER_FILES=$(cd "$OUTER/skills" && ls *.skill.md 2>/dev/null | sort)

INNER_ONLY=$(comm -23 <(echo "$INNER_FILES") <(echo "$OUTER_FILES"))
OUTER_ONLY=$(comm -13 <(echo "$INNER_FILES") <(echo "$OUTER_FILES"))
COMMON=$(comm -12 <(echo "$INNER_FILES") <(echo "$OUTER_FILES"))

# === Drift detection on common files ===
DRIFTED=()
IN_SYNC=0
while IFS= read -r f; do
  [ -z "$f" ] && continue
  inner_path="$INNER/skills/$f"
  outer_path="$OUTER/skills/$f"
  inner_hash=$(shasum -a 256 "$inner_path" | awk '{print $1}')
  outer_hash=$(shasum -a 256 "$outer_path" | awk '{print $1}')
  if [ "$inner_hash" = "$outer_hash" ]; then
    IN_SYNC=$((IN_SYNC+1))
  else
    DRIFTED+=("$f")
  fi
done <<< "$COMMON"

# === Counts ===
N_INNER_ONLY=$(echo -n "$INNER_ONLY" | grep -c . || true)
N_OUTER_ONLY=$(echo -n "$OUTER_ONLY" | grep -c . || true)
N_DRIFTED=${#DRIFTED[@]}
TOTAL_ISSUES=$((N_INNER_ONLY + N_OUTER_ONLY + N_DRIFTED))

# === Summary mode (for hook) ===
if [ $SUMMARY -eq 1 ]; then
  if [ $TOTAL_ISSUES -eq 0 ]; then
    echo "skills in sync ($IN_SYNC files)"
    exit 0
  fi
  echo "skills DRIFT: $N_DRIFTED drifted, $N_INNER_ONLY inner-only, $N_OUTER_ONLY outer-only ($IN_SYNC in sync)"
  exit 1
fi

# === Full report ===
echo "=== skills drift check ==="
echo "Inner: $INNER/skills/"
echo "Outer: $OUTER/skills/"
echo

if [ $TOTAL_ISSUES -eq 0 ]; then
  echo "IN SYNC: all $IN_SYNC files match between inner and outer."
  exit 0
fi

echo "Summary:"
echo "  in sync:     $IN_SYNC"
echo "  drifted:     $N_DRIFTED"
echo "  inner-only:  $N_INNER_ONLY"
echo "  outer-only:  $N_OUTER_ONLY"
echo

if [ $N_INNER_ONLY -gt 0 ]; then
  echo "--- inner-only files (would be created on sync) ---"
  echo "$INNER_ONLY" | sed 's/^/  /'
  echo
fi

if [ $N_OUTER_ONLY -gt 0 ]; then
  echo "--- outer-only files (NOT deleted by sync) ---"
  echo "$OUTER_ONLY" | sed 's/^/  /'
  echo
fi

if [ $N_DRIFTED -gt 0 ]; then
  echo "--- drifted files ---"
  printf '  %-44s %12s %12s %10s\n' "file" "byte_delta" "line_delta" "outer_CRs"
  for f in "${DRIFTED[@]}"; do
    inner_path="$INNER/skills/$f"
    outer_path="$OUTER/skills/$f"
    ib=$(wc -c < "$inner_path" | tr -d ' ')
    ob=$(wc -c < "$outer_path" | tr -d ' ')
    il=$(wc -l < "$inner_path" | tr -d ' ')
    ol=$(wc -l < "$outer_path" | tr -d ' ')
    inner_crs=$(tr -cd '\r' < "$inner_path" | wc -c | tr -d ' ')
    outer_crs=$(tr -cd '\r' < "$outer_path" | wc -c | tr -d ' ')
    bd=$((ib - ob))
    ld=$((il - ol))
    # CRLF-only drift heuristic
    if [ "$outer_crs" -gt 0 ] && [ "$inner_crs" -eq 0 ] \
       && [ "$bd" -eq $((-outer_crs)) ] && [ "$ld" -eq 0 ]; then
      crs_disp="${outer_crs}*"
    else
      crs_disp="$outer_crs"
    fi
    printf '  %-44s %12s %12s %10s\n' "$f" "$bd" "$ld" "$crs_disp"
  done
  echo
  echo "  (* on outer_CRs = byte_delta == -(outer_CRs), line_delta == 0,"
  echo "     inner CR-free; suggests pure CRLF→LF drift, safe to batch-sync)"
  echo
fi

exit 1
