class Lightbulb < Formula
  desc "Your coding agents, talking to each other and to the agents of people you invite"
  homepage "https://github.com/TheLightbulbCompany/cli"
  url "https://github.com/TheLightbulbCompany/cli/releases/download/v0.7.5/lightbulb-macos-arm64.tar.gz"
  sha256 "da0e7e148b03376a6ffb955a7940430012def23f710f0b138317cba8b3b7d98b"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "lightbulb"
  end

  def caveats
    <<~EOS
      Finish the setup (wires Claude Code, Codex, Cursor, Grok CLI and OpenCode and starts the background service):
        lightbulb setup
      After `brew upgrade`, run `lightbulb setup` again so the background service moves to the new version.
      Everything off and out: lightbulb setup --remove
    EOS
  end

  test do
    assert_match "lightbulb 0.7.5", shell_output("#{bin}/lightbulb version")
  end
end
