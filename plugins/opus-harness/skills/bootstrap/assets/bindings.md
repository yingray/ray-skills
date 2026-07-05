## Environment bindings (opus-harness)
<!-- Appended by /opus-harness:bootstrap below the tool-agnostic protocol. -->

How this environment implements the protocol's rules:

- **Rule 1 (verification)**: the gate is `scripts/quick-check.sh`; the
  PostToolUse hook runs it after every edit — a red gate must be fixed
  immediately, not deferred.
- **Rule 2 (plan, small steps)**: use plan mode for non-trivial work;
  checkpoint = a git commit at each green step.
- **Rule 3 (rollback)**: name the commit hash, stash, or backup path before
  destructive actions.
- **Rule 5 (lessons)**: write to auto memory; keep MEMORY.md a terse index;
  promote twice-bitten lessons into this CLAUDE.md.
- **Rule 6 (fresh eyes)**: delegate the diff to the `reviewer` agent; after
  two failed hypotheses run the `debug-reset` skill.
- **Task end**: run the `wrapup` skill — final verify, sibling sweep,
  scaffolding cleanup, memory harvest, honest report.
