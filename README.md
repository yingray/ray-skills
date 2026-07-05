# ray-skills

Personal Claude Code plugin marketplace.

The core document is [protocol.md](protocol.md) — the ~60-line operating
protocol everything else serves. The `bootstrap` skill installs it into each
project as its CLAUDE.md.

Plugins:
- [opus-harness](plugins/opus-harness/README.md) — process, memory, and
  verification harness for software engineering work.
- git-toolkit — git workflow skills: bulk-resolve PR review threads,
  cherry-pick-based conflict resolution.

## Use

```
/plugin marketplace add yingray/ray-skills
/plugin install opus-harness@ray-skills
/plugin install git-toolkit@ray-skills
```

Before publishing: `claude plugin validate` will keep warning about missing
author info until you add an `author` field to
`plugins/opus-harness/.claude-plugin/plugin.json` — intentional, so the tool
itself reminds you before you publish.
