cask "rubymine-arm64" do
  version "2020.3.2-aarch64"
  sha256 "6682659935a0d6aa252a9dfc0beaafbc4568818829b98e17da2c9b2add33c09e"

  url "https://download-cf.jetbrains.com/ruby/RubyMine-#{version.before_comma}.dmg"
  appcast "https://data.services.jetbrains.com/products/releases?code=RM&latest=true&type=release"
  name "RubyMine"
  desc "Ruby on Rails IDE"
  homepage "https://www.jetbrains.com/ruby/"

  auto_updates true

  app "RubyMine.app"

  uninstall_postflight do
    ENV["PATH"].split(File::PATH_SEPARATOR).map { |path| File.join(path, "mine") }.each do |path|
      if File.exist?(path) &&
         File.readlines(path).grep(/# see com.intellij.idea.SocketLock for the server side of this interface/).any?
        File.delete(path)
      end
    end
  end

  zap trash: [
    "~/Library/Application Support/JetBrains/RubyMine#{version.major_minor}",
    "~/Library/Caches/JetBrains/RubyMine#{version.major_minor}",
    "~/Library/Logs/JetBrains/RubyMine#{version.major_minor}",
  ]
end
