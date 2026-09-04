# homebrew-canary — moved

canary lives in one tap with the rest of them now:

```sh
brew install thousandflowers/tap/canary
```

If you installed from this tap you do not have to do anything: `tap_migrations.json`
moves you across on your next `brew update`.

This tap existed alongside `thousandflowers/homebrew-tap` and nothing bumped it,
so it served the v0.7.0 shell scripts for months after canary became a Go
binary. One tap now holds every formula, which is the only way that stops
happening.

MIT.
