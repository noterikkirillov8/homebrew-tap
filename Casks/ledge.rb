cask "ledge" do
  version "1.0.0"
  sha256 "d8423eee3135103ff9eb477cad4ed0bc287cb58bb791d3be896dfed57dfe8f47"

  url "https://github.com/noterikkirillov8/ledge/releases/download/v#{version}/Ledge-#{version}.zip"
  name "Ledge"
  desc "Drag-and-drop shelf for files"
  homepage "https://github.com/noterikkirillov8/ledge"

  depends_on macos: ">= :sequoia"

  app "Ledge.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Ledge.app"]
  end

  zap trash: [
               "~/Library/Preferences/com.erikkirillov.Ledge.plist",
               "~/Library/Caches/com.erikkirillov.Ledge",
               "~/Library/Saved Application State/com.erikkirillov.Ledge.savedState",
               "~/Library/Application Support/Ledge",
             ]
end
