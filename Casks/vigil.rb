cask "vigil" do
  version "1.0.0"
  sha256 "7816c4e6b4f5ac0c5d1535441f7e7d205c8c6b7e5b766b3b78e9d8439e6881c5"

  url "https://github.com/noterikkirillov8/vigil/releases/download/v#{version}/Vigil-#{version}.zip"
  name "Vigil"
  desc "Keeps your Mac awake for a set time, lid closed, and always ends"
  homepage "https://github.com/noterikkirillov8/vigil"

  depends_on macos: ">= :sequoia"

  app "Vigil.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Vigil.app"]
  end

  uninstall launchctl: "com.erikkirillov.Vigil.backstop",
            quit:      "com.erikkirillov.Vigil"

  zap trash:  [
                "~/Library/Application Support/Vigil",
                "~/Library/LaunchAgents/com.erikkirillov.Vigil.backstop.plist",
                "~/Library/Preferences/com.erikkirillov.Vigil.plist",
                "~/Library/Saved Application State/com.erikkirillov.Vigil.savedState",
              ],
      delete: "/etc/sudoers.d/vigil"
end
