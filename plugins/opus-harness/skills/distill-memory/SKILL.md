---
name: distill-memory
description: Periodic memory refinement — merge duplicate notes into single principles, retire notes the current model no longer needs, prune expired project state, and shrink the MEMORY.md index. Use when the user says "distill memory", "clean up memory", "refine memories", runs /opus-harness:distill-memory, or when the MEMORY.md index has grown noticeably since the last distillation.
---

# Distill Memory

Memory only grows: every session adds, nothing retires. The index is paid in
every session's context. This skill is the counterpart of wrapup's memory
harvest — run it periodically so only what still earns its tokens survives.

Three tests every line must pass:
1. **Necessity** — does this line change future behavior? Several notes
   pointing at one core value collapse into one precise principle.
2. **Model fit** — a note written to patch an old model's weakness may be
   built into the current model. Verify, then retire.
3. **Value** — each pass re-ranks what is most worth keeping; distillation
   is curation, not just deletion.

## 1. Inventory and classify

Read MEMORY.md and every memory file. Measure the starting size (chars/4 ≈
tokens). Sort each entry into one of four classes — the class decides its test:

- **Environment fact** (paths, API quirks, infra behavior): model-independent —
  no model version will ever "learn" it. Test: still true? Spot-check that the
  files, flags, or endpoints it names still exist. Stale → fix or delete.
- **User preference / feedback**: model-independent but the most duplicated
  class. Cluster notes that point at the same core value; merge each cluster
  into ONE principle file — core value first, at most three concrete
  situations kept as evidence bullets. Delete the originals.
- **Model patch** (a workaround for a model weakness): the only class tied to
  the model version. Probe before retiring — see step 2. Never delete on
  judgment alone.
- **Project state** (coordinates of ongoing work): expires naturally. Work
  finished or merged → delete, or compress to a one-line lesson.

## 2. Probe model patches

For each model-patch candidate: run a clean session that does NOT load that
memory (e.g. `claude -p` from a directory outside this project), give it the
original triggering scenario, and observe. Correct behavior without the note →
the lesson is built into the model → safe to retire. Probe failed, or not
run → keep it, marked as a candidate. A probe is a behavior sample, not a
proof, so the bar for deletion is probe pass PLUS owner approval.

## 3. Propose, then apply

- Present the full proposal BEFORE changing anything: every entry with a
  verdict (keep / merge-into-X / delete / candidate) and a one-line reason,
  drafts of the merged files, and the index size before/after estimate.
- After approval: back up the whole memory directory first and state the
  backup path (rule 3), then apply, then rewrite MEMORY.md — one line per
  entry, hook phrases tightened.
- Stamp the top of MEMORY.md with the distillation date and the model id
  that ran it. On the next run: model changed → re-probe every model patch;
  model unchanged → skip probes, do only dedup and expiry checks.

## 4. Report

Sizes before and after, the full list of deletions and merges, candidates
kept and why, and the backup path.
