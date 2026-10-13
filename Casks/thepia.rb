cask "thepia" do
  version "0.1.1"
  sha256 "ebc2a72d3b1bd8f1c1efd4cf0b43681a24bb492aa8347a9d5cb2db4139b66afb"

  url "https://cdn.thepia.com/cli/#{version}/thepia-#{version}-universal.dmg"
  name "thepia"
  desc "Terminal tools (cli, agentd, hwd) in a notarized .app"
  homepage "https://github.com/thepia/cli"

  depends_on macos: ">= :big_sur"

  app "thepia.app"
  # The CLI on PATH is the in-bundle exec-shim, never a symlink straight to the Mach-O: it resolves its
  # own symlink chain and execs the sibling binary by its full in-bundle path, preserving bundle identity
  # and the embedded provisioning profile. Same model as the Visual Studio Code cask.
  binary "#{appdir}/thepia.app/Contents/Resources/bin/thepia"

  caveats <<~EOS
    Universal build: runs natively on Intel and Apple Silicon.

    The daemons (thepia-agentd, thepia-hwd) ship inside thepia.app and are launched
    by the `thepia` command; they are not placed on PATH themselves.
  EOS
end
