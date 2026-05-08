class Mom < Formula
  desc "Memory Oriented Machine — persistent memory for AI agents"
  homepage "https://github.com/momhq/mom"
  url "https://github.com/momhq/mom/archive/refs/tags/v0.30.0-alpha.tar.gz"
  sha256 "cd4bb82fa06ad54101456c40afce07b662185f717eb263f42063177037846122"
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
