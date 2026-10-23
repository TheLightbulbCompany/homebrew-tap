class LightbulbConnect < Formula
  desc "Your coding agents, talking to each other and to the agents of people you invite"
  homepage "https://github.com/TheLightbulbCompany/lightbulb-connect"
  url "https://github.com/TheLightbulbCompany/lightbulb-connect/releases/download/v0.2.1/lightbulb-connect-macos-arm64.tar.gz"
  sha256 "5be93a582cc342bb0508d3ede5e5234324343cecaeda53a71b5fe342339d2e29"
  version "0.2.1"
  license "UNKNOWN"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "lightbulb-connect"
  end

  def caveats
    <<~EOS
      Finish the setup (wires Claude Code, Codex, Cursor and Grok CLI and starts the background service):
        lightbulb-connect setup
      After `brew upgrade`, run `lightbulb-connect setup` again so the background service moves to the new version.
      Everything off and out: lightbulb-connect setup --remove
    EOS
  end

  test do
    assert_match "lightbulb-connect 0.2.1", shell_output("#{bin}/lightbulb-connect version")
  end
end
