cask "shutter" do
  version "1.0.0"
  sha256 "01411b8364281427e4d37bc1be5ba50591f3a371e5a369bff1f256750924331b"

  url "https://github.com/noterikkirillov8/shutter/releases/download/v#{version}/Shutter-#{version}.zip"
  name "Shutter"
  desc "Menu bar organiser with a roller-shutter bar and notch awareness"
  homepage "https://github.com/noterikkirillov8/shutter"

  depends_on macos: ">= :sequoia"

  app "Shutter.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Shutter.app"]
  end

  zap trash: [
               "~/Library/Preferences/com.erikkirillov.Shutter.plist",
               "~/Library/Caches/com.erikkirillov.Shutter",
               "~/Library/Saved Application State/com.erikkirillov.Shutter.savedState",
             ]
end
