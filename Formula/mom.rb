class Mom < Formula
  desc "Memory Oriented Machine — persistent memory for AI agents"
  homepage "https://github.com/momhq/mom"
  url "https://github.com/momhq/mom/archive/refs/tags/v0.50.1-alpha.tar.gz"
  sha256 "d04fd4f1b2a02053fbbdf963a057cddb9b8a2ec4feb93c10263f17176a9e4c27"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-o", "#{bin}/mom",
      "-ldflags", "-s -w -X github.com/momhq/mom/ingress/cli.Version=#{version}",
      "./cmd/mom"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mom version")
  end
end
