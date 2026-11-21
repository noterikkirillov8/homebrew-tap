cask "harbor" do
  version "1.0.0"
  sha256 "fc130ca0f272238793c3b168a01dac752ac0251b0a0fe1c3419faa9c67564e87"

  url "https://github.com/noterikkirillov8/harbor/releases/download/v#{version}/Harbor-#{version}.zip"
  name "Harbor"
  desc "Menu bar list of listening dev servers with one-click stop"
  homepage "https://github.com/noterikkirillov8/harbor"

  depends_on macos: ">= :sequoia"

  app "Harbor.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Harbor.app"]
  end

  zap trash: [
               "~/Library/Preferences/com.erikkirillov.Harbor.plist",
               "~/Library/Caches/com.erikkirillov.Harbor",
               "~/Library/Saved Application State/com.erikkirillov.Harbor.savedState",
             ]
end
