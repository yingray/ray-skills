---
name: resolve-conflicts
description: Resolve merge conflicts by rebuilding the branch on the latest target branch with cherry-pick — no merge commits. Use when a PR has conflicts, the user says "resolve conflicts" / "fix the conflicts", a branch is behind its base, or a merge/rebase stopped on conflicts.
---

# Resolve conflicts (cherry-pick rebuild)

Never resolve conflicts with a merge commit. Rebuild the branch from the
latest tip of the target branch and cherry-pick your commits onto it —
conflicts get resolved one small commit at a time, and history stays linear.

## Steps

1. **Find the target branch**: the PR base
   (`gh pr view --json baseRefName -q .baseRefName`), else the repo default
   branch (`main` / `master`).
2. **Fetch the latest** — always start from the target's current tip, never a
   stale local copy:
   ```bash
   git fetch origin
   ```
3. **List your commits** (oldest first, merges excluded):
   ```bash
   git rev-list --reverse --no-merges origin/<target>..HEAD
   ```
   If a merge/rebase is currently half-done, abort it first
   (`git merge --abort` / `git rebase --abort`).
4. **Rebuild on the latest target**:
   ```bash
   git checkout -B <branch>-rebuild origin/<target>
   git cherry-pick <commit>...   # one at a time, in order
   ```
   Resolve conflicts per commit; keep each commit's intent intact.
   Already-upstream commit → `git cherry-pick --skip`.
5. **Verify** (build / tests / quick-check) before touching the real branch.
6. **Move the branch and push**:
   ```bash
   git branch -f <branch> HEAD && git checkout <branch>
   git push --force-with-lease origin <branch>
   ```
   `--force-with-lease` only, never `--force`. Only on your own feature
   branch — if others may have pushed to it, stop and ask first.

## Notes

- The rebuild branch is your rollback: the original commits stay reachable
  until you delete `<branch>-rebuild`. Delete it after the push is verified.
- Conflicts repeating across many commits → consider squashing first
  (`git rebase -i origin/<target>` is fine locally), then cherry-pick fewer,
  cleaner commits.
