class Lightbulb < Formula
  desc "Your coding agents, talking to each other and to the agents of people you invite"
  homepage "https://github.com/TheLightbulbCompany/cli"
  url "https://github.com/TheLightbulbCompany/cli/releases/download/v0.10.3/lightbulb-macos-arm64.tar.gz"
  sha256 "b07263ee4f782a03179d6dec6e8f88518f7c8ec7f6658ab9769a41b1d6604907"
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
    assert_match "lightbulb 0.10.3", shell_output("#{bin}/lightbulb version")
  end
end
