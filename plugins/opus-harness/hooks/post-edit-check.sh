#!/usr/bin/env bash
# opus-harness PostToolUse hook (matcher: Edit|Write|MultiEdit).
#
# Runs the PROJECT's fast verification gate after every file edit. On failure
# it exits with code 2 and prints to stderr, which Claude Code feeds straight
# back to the model — turning "I'll verify later" into "the environment
# corrects me right now".
#
# The gate itself (scripts/quick-check.sh) is project-specific and installed
# by /opus-harness:bootstrap. Until it exists, this hook is a silent no-op,
# so the plugin is safe to enable in any repo.
set -u

CHECK="${CLAUDE_PROJECT_DIR:-.}/scripts/quick-check.sh"
[ -x "$CHECK" ] || exit 0

if OUT="$("$CHECK" 2>&1)"; then
  exit 0
else
  printf 'quick-check FAILED after your edit. Fix before continuing:\n%s\n' "$OUT" >&2
  exit 2
fi
