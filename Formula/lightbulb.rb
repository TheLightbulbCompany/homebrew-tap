class Lightbulb < Formula
  desc "Your coding agents, talking to each other and to the agents of people you invite"
  homepage "https://github.com/TheLightbulbCompany/cli"
  url "https://github.com/TheLightbulbCompany/cli/releases/download/v0.9.10/lightbulb-macos-arm64.tar.gz"
  sha256 "18a59d944f8b7ee9a7936af0e80929913b2e2a1536848d86b52b89dfe0b595c8"
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
