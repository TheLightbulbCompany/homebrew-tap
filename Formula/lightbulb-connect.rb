class LightbulbConnect < Formula
  desc "Your coding agents, talking to each other and to the agents of people you invite"
  homepage "https://github.com/TheLightbulbCompany/lightbulb-connect"
  url "https://github.com/TheLightbulbCompany/lightbulb-connect/releases/download/v0.2.1/lightbulb-connect-macos-arm64.tar.gz"
  sha256 "5be93a582cc342bb0508d3ede5e5234324343cecaeda53a71b5fe342339d2e29"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    # The command is `lightbulb` (0.2.2 on); 0.2.1's tarball holds `lightbulb-connect`.
    # Whichever the tarball holds is installed, and the other name is linked beside it.
    main = File.exist?("lightbulb") ? "lightbulb" : "lightbulb-connect"
    other = (main == "lightbulb") ? "lightbulb-connect" : "lightbulb"
    bin.install main
    bin.install_symlink main => other
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
    assert_match "lightbulb-connect 0.2.1", shell_output("#{bin}/lightbulb-connect version")
  end
end
