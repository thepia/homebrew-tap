# Thepia Homebrew tap

Homebrew cask for the [`thepia`](https://github.com/thepia/cli) terminal tools (cli, agentd, hwd),
distributed as a notarized, stapled macOS `.app`.

```sh
brew tap thepia/tap
brew trust thepia/tap     # recent Homebrew requires trusting a third-party tap once
brew install --cask thepia
thepia --version
```

The cask downloads the signed DMG from `cdn.thepia.com`, installs `thepia.app` to `/Applications`, and
puts `thepia` on PATH via the app's in-bundle exec-shim. See the cask in [`Casks/thepia.rb`](Casks/thepia.rb).

Requirements: macOS 11 (Big Sur)+. The 0.1.0 build is x86_64 (Intel); it runs on Apple Silicon via
Rosetta 2. A universal build is planned.

Other install options (no Homebrew): `curl --proto '=https' --tlsv1.2 -fsSL https://cdn.thepia.com/cli/install.sh | sh`.
