cask "macfuse-arm64" do
  version "4.0.4"
  sha256 "3e1b52a78ba6530cba2fb34a64c1da2ef969e03aeb2a58ae622cb0f09772d450"

  # github.com was verified as official when first introduced to the cask
  url "https://github.com/osxfuse/osxfuse/releases/download/macfuse-#{version}/macfuse-#{version}.dmg",
    verified: "https://github.com/osxfuse"
  appcast "https://github.com/osxfuse/osxfuse/releases.atom"
  name "MACFUSE"
  desc "File system integration"
  homepage "https://osxfuse.github.io/"

  pkg "Extras/macFUSE #{version}.pkg"

  postflight do
    set_ownership ["/usr/local/include", "/usr/local/lib"]
  end

  uninstall script:  {
    executable: "/Library/Filesystems/macfuse.fs/Contents/Resources/uninstall_macfuse.app/Contents/Resources/Scripts/uninstall_macfuse.sh",
    sudo:       true,
  }

  zap trash: "~/Library/Caches/com.github.macfuse.OSXFUSEPrefPane"

  caveats do
    reboot
  end
end
