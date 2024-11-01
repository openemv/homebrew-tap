class Tr31 < Formula
  desc "Key block library and tools for ANSI X9.143, ASC X9 TR-31 and ISO 20038"
  homepage "https://github.com/openemv/tr31"
  url "https://github.com/openemv/tr31/releases/download/0.6.2/tr31-0.6.2-src.tar.gz"
  sha256 "8ebe2dbe7eca00ca97000e56afb8028fa55dd0a92bb1e4d08b1482d956833e38"
  license "LGPL-2.1-or-later"
  head "https://github.com/openemv/tr31.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "mbedtls"
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
