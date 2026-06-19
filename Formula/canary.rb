class Canary < Formula
  desc "Pixel-art fatigue bird that lives in Claude Code's status line"
  homepage "https://github.com/thousandflowers/canary"
  url "https://github.com/thousandflowers/canary/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6fb72f22fc28721d182259317981a2c32741320fad6aedeed4326f87f926d2d2" # shasum -a 256 of the v0.4.0 tarball
  license "MIT"

  def install
    pkgshare.install "canary-statusline.sh", "install.sh", "uninstall.sh"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      canary lives in Claude Code's status line, not your shell. Wire it:

        sh #{opt_pkgshare}/install.sh

      Restart Claude Code to meet the bird. Tame it with CANARY_DISABLED,
      CANARY_MIN_SCORE, CANARY_SHOW_SCORE, CANARY_ERR_WEIGHT (see README).
    EOS
  end

  test do
    assert_path_exists pkgshare/"canary-statusline.sh"
    output = pipe_output(
      "/bin/bash #{pkgshare}/canary-statusline.sh",
      '{"cost":{"total_duration_ms":0}}',
    )
    assert_match "fresh", output
  end
end
