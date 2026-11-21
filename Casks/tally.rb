cask "tally" do
  version "1.0.0"
  sha256 "dc0ef83f7c12658c6dd0b48ed3268c29f5381bae8bb6e4e2e9ba7c36776ec895"

  url "https://github.com/noterikkirillov8/tally/releases/download/v#{version}/Tally-#{version}.zip"
  name "Tally"
  desc "Claude and Codex plan usage in the menu bar"
  homepage "https://github.com/noterikkirillov8/tally"

  depends_on macos: ">= :sequoia"

  app "Tally.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Tally.app"]
  end

  zap trash: [
               "~/Library/Preferences/com.erikkirillov.Tally.plist",
               "~/Library/Caches/com.erikkirillov.Tally",
               "~/Library/Saved Application State/com.erikkirillov.Tally.savedState",
             ]
end
