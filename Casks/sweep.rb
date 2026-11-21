cask "sweep" do
  version "1.0.0"
  sha256 "57578874cf8606d29b845a43db8d6f53a4fd51b6fce7efd25845d3739c1e8f98"

  url "https://github.com/noterikkirillov8/sweep/releases/download/v#{version}/Sweep-#{version}.zip"
  name "Sweep"
  desc "Finds rebuildable dev junk and moves it to the Trash"
  homepage "https://github.com/noterikkirillov8/sweep"

  depends_on macos: ">= :sequoia"

  app "Sweep.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Sweep.app"]
  end

  zap trash: [
               "~/Library/Preferences/com.erikkirillov.Sweep.plist",
               "~/Library/Caches/com.erikkirillov.Sweep",
               "~/Library/Saved Application State/com.erikkirillov.Sweep.savedState",
               "~/Library/Application Support/Sweep",
             ]
end
