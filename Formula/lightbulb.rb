class Lightbulb < Formula
  desc "Your coding agents, talking to each other and to the agents of people you invite"
  homepage "https://github.com/TheLightbulbCompany/cli"
  url "https://github.com/TheLightbulbCompany/cli/releases/download/v0.2.1/lightbulb-connect-macos-arm64.tar.gz"
  sha256 "5be93a582cc342bb0508d3ede5e5234324343cecaeda53a71b5fe342339d2e29"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    # 0.2.1's tarball still holds the binary under its old name; the command is `lightbulb`.
    File.rename "lightbulb-connect", "lightbulb" if File.exist?("lightbulb-connect")
    bin.install "lightbulb"
  end

  def caveats
    <<~EOS
      Finish the setup (wires Claude Code, Codex, Cursor and Grok CLI and starts the background service):
        lightbulb setup
      After `brew upgrade`, run `lightbulb setup` again so the background service moves to the new version.
      Everything off and out: lightbulb setup --remove
    EOS
  end

  test do
    assert_match "lightbulb-connect 0.2.1", shell_output("#{bin}/lightbulb version")
  end
end
