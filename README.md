# ray-skills

Personal Claude Code plugin marketplace.

Core documents:

- [protocol.md](protocol.md) — the operating protocol everything else serves.
  Written in Traditional Chinese. It covers rule priority, a standard
  workflow, verification, destructive-action safety, compatibility, and
  when to escalate to a human. It is deliberately tool-agnostic: usable as
  guiding principles for any AI, with no dependency on this marketplace's
  plugins. The `bootstrap` skill installs it into each project as its
  CLAUDE.md and appends the environment-specific bindings separately.
- [preference.md](preference.md) — Ray's personal preferences, kept out of
  the protocol: communication style, output language rules (chat in
  Traditional Chinese, code/commits/PRs in simple English), link format,
  and local git and tooling constraints.

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
