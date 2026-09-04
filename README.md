# homebrew-canary — deprecated

This tap moved. Install canary from the one tap that holds all of them:

```sh
brew install thousandflowers/tap/canary
```

If you installed from here, switch over once:

```sh
brew uninstall canary
brew untap thousandflowers/canary
brew install thousandflowers/tap/canary
```

This repo stays up so existing installs keep resolving, but nothing bumps it:
it sat on v0.7.0 for months after canary became a Go binary, which is why one
tap now holds every formula.

MIT.
