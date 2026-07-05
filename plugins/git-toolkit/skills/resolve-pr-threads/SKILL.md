---
name: resolve-pr-threads
description: Resolve all unresolved review threads (conversations) on a GitHub PR in one go. Use when the user wants to bulk-resolve PR review comments/conversations to unblock merging — e.g. "resolve all threads", "resolve the conversations on PR X" — or when a PR is BLOCKED only by unresolved review threads.
---

# Resolve PR review threads

Bulk-resolve every unresolved review thread on a PR using the bundled script.

Script: `${CLAUDE_PLUGIN_ROOT}/skills/resolve-pr-threads/scripts/gh-resolve-threads`

```bash
gh-resolve-threads <owner/repo> <pr-number> [--dry-run]
```

Needs `gh` authenticated with write access to the repo.

## Workflow

1. If the repo or PR number is not given, derive them from the current
   branch (`gh pr view --json number,headRepositoryOwner` or
   `gh repo view --json nameWithOwner`).
2. **Always dry-run first** and show the user the list (path:line + author
   of the first comment in each thread).
3. Check the authors:
   - All bots (`copilot-pull-request-reviewer`, `greptile*`, `coderabbit*`,
     `*[bot]`, etc.) → run the real resolve directly.
   - Any **human** reviewer thread → do NOT silently resolve it. Point the
     human threads out and ask whether to include them. Resolving a human's
     comment without a reply reads as dismissive; suggest replying first.
4. After resolving, re-check the PR:
   `gh pr view <pr> --json mergeStateStatus,mergeable`
   - `BLOCKED` → something else still blocks (required checks, reviews).
   - `UNSTABLE` → mergeable; only non-required checks are red.

## Notes

- Resolving is reversible (threads can be unresolved in the GitHub UI),
  but treat it as an outward-facing action: it is visible to reviewers.
- The script paginates (100/page), so PRs with >100 threads are fine.
- If the script is missing, the core is: GraphQL `reviewThreads` query to
  list `{id, isResolved}`, then a `resolveReviewThread(input: {threadId})`
  mutation per unresolved id.
