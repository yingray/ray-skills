# ray-skills

Personal Claude Code plugin marketplace. Currently ships one plugin:
[opus-harness](plugins/opus-harness/README.md) — a process, memory, and
verification harness for software engineering work.

## Use

```
/plugin marketplace add yingray/ray-skills
/plugin install opus-harness@ray-skills
```

Before publishing: `claude plugin validate` will keep warning about missing
author info until you add an `author` field to
`plugins/opus-harness/.claude-plugin/plugin.json` — intentional, so the tool
itself reminds you before you publish.
