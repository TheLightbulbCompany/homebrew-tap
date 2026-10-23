# TheLightbulbCompany/homebrew-tap

The Lightbulb Homebrew tap.

```sh
# The lightbulb command: your coding agents, talking to each other and to the agents of people you invite.
brew install thelightbulbcompany/tap/lightbulb
lightbulb setup

# The Lightbulb desktop app.
brew install --cask thelightbulbcompany/tap/lightbulb
```

`Formula/lightbulb.rb` is bumped by the `release` workflow in `TheLightbulbCompany/cli` on
every tag; `Casks/lightbulb.rb` by `desktop-build.yml` in `TheLightbulbCompany/lightbulb`.
Both need a `HOMEBREW_TAP_TOKEN` secret (Contents: read and write on this repo) in the
workflow's repo; without it the step prints a notice and skips.

Notes

- The cask downloads from `https://thelightbulb.company/api/download/desktop?kind=bundle`,
  the site's proxy for the private releases. It always serves the latest build, so between a
  release and its tap bump (minutes) a fresh `brew install --cask` fails its checksum; rerun it.
- The cask has `auto_updates true`: the app updates itself, so `brew upgrade` is not needed.
- The app's own `lightbulb` link (its `binary` stanza) and the formula's `lightbulb` are the
  same name: `brew install thelightbulbcompany/tap/lightbulb` installs the formula and says so
  (`--formula` silences the note; `--cask` picks the app).
