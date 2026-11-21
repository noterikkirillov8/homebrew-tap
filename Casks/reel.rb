cask "reel" do
  version "1.0.0"
  sha256 "427c62e111243c1c2ad983c103452950f13105054a62c8ab4a8c9046d69b23b3"

  url "https://github.com/noterikkirillov8/reel/releases/download/v#{version}/Reel-#{version}.zip"
  name "Reel"
  desc "Screen recorder that turns clicks into smooth zooms"
  homepage "https://github.com/noterikkirillov8/reel"

  depends_on macos: ">= :sequoia"

  app "Reel.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Reel.app"]
  end

  zap trash: [
               "~/Library/Preferences/com.erikkirillov.Reel.plist",
               "~/Library/Caches/com.erikkirillov.Reel",
               "~/Library/Saved Application State/com.erikkirillov.Reel.savedState",
             ]
end
