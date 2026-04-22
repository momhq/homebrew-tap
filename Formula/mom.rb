class Mom < Formula
  desc "Memory Oriented Machine — persistent memory for AI agents"
  homepage "https://github.com/momhq/mom"
  url "https://github.com/momhq/mom/archive/refs/tags/v0.11.1.tar.gz"
  sha256 "0cd0ce7eab9f5e189f3ccae4389b6e5e67177157a512faf44802aea845c92afe"
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
