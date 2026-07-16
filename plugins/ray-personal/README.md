# ray-personal

Ray's personal customizations. This plugin holds per-user settings that do
not belong in shared plugins like opus-harness.

## Contents

- `output-styles/ray.md` — communication style (Traditional Chinese,
  plain wording, conclusion-first). Activate it via `/config` → Output
  style, or set `"outputStyle": "Ray"` in `~/.claude/settings.json`.
- `skills/talk-simple` — `/talk-simple {message}` answers in plain
  everyday language, concrete, no unexplained jargon.
- `skills/talk-less` — `/talk-less {message}` answers in under 100-200
  characters.
- `skills/talk-less-simple` — `/talk-less-simple {message}` combines
  both rules.
