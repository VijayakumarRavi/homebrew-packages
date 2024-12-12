cask "rave" do
  version "1.15.19"
  sha256 "f5fa7c9459a7284c7988fbaaa7f0a2ce4a2b8a282e0f0f243156d600928a70a7"
  #sha256 :no_check

  url "https://cdn.cooldaddypop.com/rave-desktop/mac/x64/Rave-#{version}.dmg",
      verified: "cdn.cooldaddypop.com/rave-desktop/mac/x64/"
  name "Rave"
  desc "App for watching videos and listening to music with friends in real-time"
  homepage "https://www.rave.io/"

  livecheck do
    url "https://app.rave-web.com/mac"
    strategy :header_match do |headers|
      headers["location"][/Rave-(\d+\.\d+\.\d+)\.dmg/i, 1]
    end
  end

  # Define the app installation location
  app "Rave.app"

  # Optional: Add zap stanza for cleaning up leftover files when uninstalling
  zap trash: [
    "~/Library/Application Support/Rave",
    "~/Library/Preferences/com.rave.desktop.plist",
    "~/Library/Logs/Rave",
    "~/Library/Caches/rave-desktop-updater",
    "~/Library/Caches/io.rave.desktop",
    "~/Library/Caches/io.rave.desktop.ShipIt",
  ]
end
