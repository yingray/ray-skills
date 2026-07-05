#!/usr/bin/env bash
# ============================================================================
# quick-check.sh — this project's fast verification gate.
# Run automatically by the opus-harness PostToolUse hook after every edit,
# and required by CLAUDE.md before any "done" claim.
#
# Rules: < 60 seconds TOTAL. Fail fast. Print only failures.
#
# TODO(bootstrap): replace the placeholder with this project's real checks.
#   Node/TS:  npx tsc --noEmit && npx eslint . --quiet
#   Python:   ruff check . && mypy src/
#   Rust:     cargo check --quiet && cargo clippy --quiet -- -D warnings
#   Go:       go vet ./... && go build ./...
# Then add the fastest meaningful test subset if it fits the budget.
# ============================================================================
set -euo pipefail
cd "$(dirname "$0")/.."

# TODO(bootstrap): real checks go here.
exit 0
