# install_pre_push_hook.sh
# Installs a pre-push hook on the inner TavernOS repo that warns (does NOT
# block) when skills drift exists between inner and outer.
#
# The hook calls check_skills_drift.sh --summary; on nonzero exit it prints
# a warning to stderr and continues. Push is never blocked.
#
# Idempotent: refuses to overwrite an existing hook. To reinstall, remove
# the existing hook first and re-run.

set -u

INNER=~/TavernOS/tavernos
HOOK_PATH="$INNER/.git/hooks/pre-push"

echo "=== install pre-push drift warning hook ==="
echo "Inner repo: $INNER"
echo "Hook path:  $HOOK_PATH"
echo

if [ ! -d "$INNER/.git" ]; then
  echo "ABORT: $INNER/.git not found (is it a git repo?)"
  exit 2
fi

if [ -e "$HOOK_PATH" ]; then
  echo "Existing pre-push hook found:"
  echo "--- begin existing hook ---"
  cat "$HOOK_PATH"
  echo "--- end ---"
  echo
  echo "ABORT: refusing to overwrite. To replace it:"
  echo "  rm $HOOK_PATH"
  echo "  bash $0"
  exit 1
fi

mkdir -p "$INNER/.git/hooks"

cat > "$HOOK_PATH" <<'HOOK_EOF'
#!/bin/bash
# Pre-push hook: warn (not block) on skills drift between inner and outer.
# Installed by ~/TavernOS/tavernos-skills/scripts/install_pre_push_hook.sh
# DO NOT EDIT — managed by P0-SYNC automation.

DRIFT_CHECK=~/TavernOS/tavernos-skills/scripts/check_skills_drift.sh

if [ ! -f "$DRIFT_CHECK" ]; then
  exit 0
fi

OUTPUT=$(bash "$DRIFT_CHECK" --summary 2>/dev/null)
EC=$?

if [ $EC -ne 0 ]; then
  echo "" >&2
  echo "WARNING: $OUTPUT" >&2
  echo "  Run 'make -C ~/TavernOS/tavernos-skills sync-skills' to resolve." >&2
  echo "  (push proceeding — this is a warning, not a block)" >&2
  echo "" >&2
fi

exit 0
HOOK_EOF

chmod +x "$HOOK_PATH" || { echo "ABORT: chmod failed"; exit 3; }

echo "Hook installed: $HOOK_PATH"
echo
echo "Smoke test (should print nothing and exit 0 when in sync):"
bash "$HOOK_PATH"
RC=$?
echo "(hook exit code: $RC)"
echo
echo "DONE. Pre-push hook will warn on drift but never block pushes."
