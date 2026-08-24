class Mom < Formula
  desc "Memory Oriented Machine — persistent memory for AI agents"
  homepage "https://github.com/momhq/mom"
  url "https://github.com/momhq/mom/archive/refs/tags/v0.53.0-alpha.tar.gz"
  sha256 "f500606a3448cf06a4a9d2c7c946dc6e59bfa806ce1dec2a89785b949d74bce7"
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
