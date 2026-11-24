cask "pinch" do
  version "0.1.0"
  sha256 "d1b7b9de7a62fd2bd5fe265581345a9664fb18818f9b02dead6b8b0dd677c2f4"

  url "https://github.com/noterikkirillov8/pinch/releases/download/v#{version}/Pinch-#{version}.zip"
  name "Pinch"
  desc "Shrinks screenshots, photos and videos as you copy them"
  homepage "https://github.com/noterikkirillov8/pinch"

  depends_on macos: ">= :sequoia"

  app "Pinch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pinch.app"]
  end

  zap trash: [
               "~/Library/Preferences/com.erikkirillov.Pinch.plist",
               "~/Library/Caches/com.erikkirillov.Pinch",
               "~/Library/Saved Application State/com.erikkirillov.Pinch.savedState",
               "~/Library/Application Support/Pinch",
             ]
end
