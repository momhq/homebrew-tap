class Mom < Formula
  desc "Memory Oriented Machine — persistent memory for AI agents"
  homepage "https://github.com/momhq/mom"
  url "https://github.com/momhq/mom/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "c5f2a425637f7ff059008e0e605181b41064bd6d44598b4e56a564ba5e23d11c"
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
