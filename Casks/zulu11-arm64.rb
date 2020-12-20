cask "zulu11-arm64" do
  if Hardware::CPU.arch == :arm64
    version "11.0.9.1,11.43.1015-ca"
    sha256 "e6e55cb09b535a3d195a9b1719613842b6af01e6e7536c98fddb1cd28fd44f78"
  else
    version "11.0.9.1,11.43.1015-ca"
    sha256 "18ba26ead6b15b4e8b6f9301053f962f2a7da3fb6f1d49a81957235979783cda"
  end

  if Hardware::CPU.arch == :arm64
    url "https://cdn.azul.com/zulu/bin/zulu#{version.after_comma}-jdk#{version.before_comma}-macos_aarch64.dmg",
        referer: "https://www.azul.com/downloads/zulu/zulu-mac/"
  else
    url "https://cdn.azul.com/zulu/bin/zulu#{version.after_comma}-jdk#{version.before_comma}-macosx_x64.dmg",
        referer: "https://www.azul.com/downloads/zulu/zulu-mac/"
  end
  name "Azul Zulu Java Standard Edition Development Kit"
  homepage "https://www.azul.com/downloads/zulu/zulu-mac/"

  pkg "Double-Click to Install Zulu #{version.major}.pkg"

  uninstall pkgutil: "com.azulsystems.zulu.#{version.major}"
end
