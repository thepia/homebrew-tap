cask "thepia" do
  version "0.1.0"
  sha256 "2372dc470c642c9914609250e572792f9acf2e576e1c1979cd07b7a10bdf07a4"

  url "https://cdn.thepia.com/cli/#{version}/thepia-#{version}-x86_64.dmg"
  name "thepia"
  desc "Thepia terminal tools (cli, agentd, hwd) in a notarized .app"
  homepage "https://github.com/thepia/cli"

  depends_on macos: ">= :big_sur"

  app "thepia.app"
  # The CLI on PATH is the in-bundle exec-shim, never a symlink straight to the Mach-O: it resolves its
  # own symlink chain and execs the sibling binary by its full in-bundle path, preserving bundle identity
  # and the embedded provisioning profile. Same model as the Visual Studio Code cask.
  binary "#{appdir}/thepia.app/Contents/Resources/bin/thepia"

  caveats <<~EOS
    This 0.1.0 build is x86_64 (Intel). On Apple Silicon it runs via Rosetta 2
    (install with: softwareupdate --install-rosetta). A universal build is planned.

    The daemons (thepia-agentd, thepia-hwd) ship inside thepia.app and are launched
    by the `thepia` command; they are not placed on PATH themselves.
  EOS
end
