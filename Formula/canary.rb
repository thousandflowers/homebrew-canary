class Canary < Formula
  desc "Pixel-art fatigue bird that lives in your shell prompt"
  homepage "https://github.com/thousandflowers/canary"
  url "https://github.com/thousandflowers/canary/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5da5f0a6461abd33a742cefecec5d84347ea0d127e2132625cf358b56af7912e"
  license "MIT"

  def install
    pkgshare.install "canary.sh", "canary.fish"
    doc.install "README.md", "demo.tape"
  end

  def caveats
    <<~EOS
      canary is a shell snippet, not a binary. Add it to your shell rc:

        zsh / bash:
          echo 'source #{opt_pkgshare}/canary.sh' >> ~/.zshrc      # or ~/.bashrc

        fish:
          echo 'source #{opt_pkgshare}/canary.fish' >> ~/.config/fish/config.fish

      Open a new shell to meet the bird. Control it with `canary status`,
      or CANARY_DISABLED / CANARY_RESET / CANARY_SHOW_SCORE.
    EOS
  end

  test do
    assert_path_exists pkgshare/"canary.sh"
    output = shell_output("/bin/bash -c '. #{pkgshare}/canary.sh; _canary_render 0 show'")
    assert_match "fresh", output
  end
end
