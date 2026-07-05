---
name: wrapup
description: End-of-task ritual that converts this session's work into compounding assets. Use whenever a task is completed or abandoned, when the user says "done", "ship it", "wrap up", "let's stop here", runs /opus-harness:wrapup, and before context compaction in long sessions.
---

# Wrapup

A session that only produced a diff captured half its value. Harvest the other
half before closing. Order matters — verification comes first. This skill owns
the full procedures; CLAUDE.md rules 3, 5, and 8 point here.

## 1. Final verification (gate)
Run `scripts/quick-check.sh` and the relevant tests one last time; paste the
results. Anything not verified is reported to the user as `UNVERIFIED:` —
never silently. If any summary claims "all green" or "nothing missing",
spot-check one underlying record yourself — aggregators fail silently.

## 2. Class sweep
For each bug fixed or lesson learned this session: it was probably a CLASS,
not an instance.
- Grep for sibling occurrences of the same pattern. Same-bug siblings are in
  scope — fix the trivial ones now; list the rest for the user. Unrelated
  finds are reported, not silently done.
- If the bug escaped quick-check.sh, add the check or test that would have
  caught it. This is the single highest-leverage edit of the session.

## 3. Cleanup pass (retire the escape hatches)
- Delete backup files, temp copies of old versions, commented-out blocks,
  debug prints, and scratch scripts created this session.
- Any feature toggle whose feature is now verified and in use: retire it, or
  list it as an owner decision.
- `git status` must end clean: everything committed, or intentionally listed
  for the user.

## 4. Memory harvest (auto memory)
Write to the memory directory, then update the MEMORY.md index (keep it terse):
- Root causes found (with the verifying command), landmines hit, decisions
  made and WHY.
- Exact commands that proved things (deploy check, tricky test invocation).
- PRUNE stale or duplicated notes in any topic file you touched.
- PROMOTE: anything that has now bitten twice → propose it to the user as a
  CLAUDE.md rule.

## 5. Report
Short summary: what shipped (verified, with evidence), what remains
`UNVERIFIED:`, siblings found in the class sweep, memory entries written, and
any owner decisions parked for the human.
