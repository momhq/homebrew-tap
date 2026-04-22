class Mom < Formula
  desc "Memory Oriented Machine — persistent memory for AI agents"
  homepage "https://github.com/momhq/mom"
  url "https://github.com/momhq/mom/archive/refs/tags/v0.11.2.tar.gz"
  sha256 "9195bab313946552f1775655f0527966228db044e76b69538debcb56968b0752"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    cd "cli" do
      system "go", "build",
        "-o", "#{bin}/mom",
        "-ldflags", "-s -w -X github.com/momhq/mom/cli/internal/cmd.Version=#{version}",
        "./cmd/mom"
    end
    bin.install_symlink "mom" => "leo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mom version")
  end
end
