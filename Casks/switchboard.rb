cask "switchboard" do
  version "1.0.0"
  sha256 "4823a5d69b46f6ee61a7f2f9ee1dff8f284716b858808ee3dcd036de6653aa2a"

  url "https://github.com/noterikkirillov8/switchboard/releases/download/v#{version}/Switchboard-#{version}.zip"
  name "Switchboard"
  desc "Menu bar board of running Claude Code and Codex sessions"
  homepage "https://github.com/noterikkirillov8/switchboard"

  depends_on macos: ">= :sequoia"

  app "Switchboard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Switchboard.app"]
  end

  zap trash: [
               "~/Library/Preferences/com.erikkirillov.Switchboard.plist",
               "~/Library/Caches/com.erikkirillov.Switchboard",
               "~/Library/Saved Application State/com.erikkirillov.Switchboard.savedState",
               "~/Library/Application Support/Switchboard",
             ]
end
