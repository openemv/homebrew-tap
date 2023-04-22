class Tr31 < Formula
  desc "ASC X9 TR-31 library and tools"
  homepage "https://github.com/openemv/tr31"
  url "https://github.com/openemv/tr31/releases/download/0.4.6/tr31-0.4.6-src.tar.gz"
  sha256 "91e121ce056a6930652d8e260a4fac4f5adf125af916324db45913586893ef58"
  license "LGPL-2.1-or-later"
  head "https://github.com/openemv/tr31.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "mbedtls@2"
  depends_on "bash-completion" => :recommended
  depends_on "doxygen" => :optional

  on_macos do
    depends_on "argp-standalone" => :build
  end

  def install
    system "cmake", "-S", ".", "-B", "build",
      *std_cmake_args,
      "-DBUILD_SHARED_LIBS=YES",
      "-DCMAKE_INSTALL_RPATH=#{rpath}"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
