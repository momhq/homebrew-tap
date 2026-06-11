class Mom < Formula
  desc "Memory Oriented Machine — persistent memory for AI agents"
  homepage "https://github.com/momhq/mom"
  url "https://github.com/momhq/mom/archive/refs/tags/v0.50.0-alpha.tar.gz"
  sha256 "2f7a04304750abafafa24f06dcf52bf4b2a7e373efb0f761f19431257211893c"
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
