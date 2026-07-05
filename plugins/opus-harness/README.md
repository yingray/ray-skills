# opus-harness

Process, memory, and verification harness for Claude Code. Goal: push an
Opus-class model toward Fable-class **reliability** on software engineering
work by substituting cheap environmental feedback for raw single-pass
judgment. Honest limit: it raises the floor on known task types; it does not
upgrade the model — novel reasoning still escalates to the human (protocol
rule 7).

## Install

```
/plugin marketplace add yingray/ray-skills     # local path also works while testing
/plugin install opus-harness@ray-skills
```

Then, inside each project: run `/opus-harness:bootstrap` and accept the
workspace trust dialog when prompted.

## Components

| Piece | Kind | Job |
|---|---|---|
| bootstrap | skill | generates the project CLAUDE.md protocol + quick-check gate; proposes minimal permissions |
| post-edit-check | hook (PostToolUse) | runs the project's quick-check after every edit; failures return as stderr the model must fix now |
| reviewer | agent | fresh-context diff review before any "done" |
| debug-reset | skill | belief-reset protocol after two failed hypotheses on one bug |
| wrapup | skill | verify → class sweep → cleanup → memory harvest (`/opus-harness:wrapup`) |

Why bootstrap *generates* instead of ships: plugins cannot carry CLAUDE.md or
permission rules, and the protocol should live where you can see and edit it.

## Acceptance loop (do not skip)

Run 3–5 representative tasks, including one the model previously failed.
Where behavior deviated, tighten the specific rule, hook, or skill — and
prefer promoting repeat offenses up the ladder: memory → CLAUDE.md rule →
hook. One git commit per tuning round; two or three rounds is where it
settles.

## Maintenance

The generated protocol stays ~50 lines; adding a rule → consider removing
one. `claude plugin details opus-harness` shows the context cost you are
paying for this plugin.
