class Mom < Formula
  desc "Memory Oriented Machine — persistent memory for AI agents"
  homepage "https://github.com/momhq/mom"
  url "https://github.com/momhq/mom/archive/refs/tags/v0.52.0-alpha.tar.gz"
  sha256 "e5332f1a16a7ef8fa03caddb708d61c959eeeceb8f19b1d50ebec75d4578a65b"
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
