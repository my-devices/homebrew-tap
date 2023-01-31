class MacchinaRemoteTools < Formula
  desc "Device agent and client tools for macchina.io REMOTE"
  homepage "https://macchina.io/remote"
  url "https://github.com/my-devices/sdk/archive/refs/tags/macchina-remote-sdk-1.15.0.tar.gz"
  sha256 "51437117d7f0d59640fe08f494deb8ec02c57eb90674b2a62fee0d38e39e9966"
  license "BSL-1.0"
  head "https://github.com/my-devices/sdk.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "openssl@3"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install Dir["build/bin/remote-*"], "build/bin/WebTunnelAgent"
  end

  test do
    system bin/"remote-ssh", "-h"
  end
end
