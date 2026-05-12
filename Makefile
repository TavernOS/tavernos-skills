# TavernOS skills registry — sync hygiene targets
# Wraps scripts/ that drive inner→outer registry sync.

.PHONY: help check-drift sync-skills install-hook

help:
	@echo "TavernOS skills registry targets:"
	@echo ""
	@echo "  make check-drift   Report any inner-outer skills drift (read-only)"
	@echo "  make sync-skills   Sync drifted/new skills from inner to outer"
	@echo "  make install-hook  Install pre-push warning hook on inner repo"
	@echo "  make help          This message"

check-drift:
	@bash scripts/check_skills_drift.sh

sync-skills:
	@bash scripts/sync_skills_from_inner.sh

install-hook:
	@bash scripts/install_pre_push_hook.sh
