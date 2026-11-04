class Lightbulb < Formula
  desc "Your coding agents, talking to each other and to the agents of people you invite"
  homepage "https://github.com/TheLightbulbCompany/cli"
  url "https://github.com/TheLightbulbCompany/cli/releases/download/v0.9.10/lightbulb-macos-arm64.tar.gz"
  sha256 "c89a2f721a53363527f00844b8249be1139757a872f4486b320a4d3ed13bb8b8"
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
    assert_match "lightbulb 0.9.10", shell_output("#{bin}/lightbulb version")
  end
end
