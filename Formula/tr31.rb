class Tr31 < Formula
  desc "ASC X9 TR-31 library and tools"
  homepage "https://github.com/openemv/tr31"
  url "https://github.com/openemv/tr31/releases/download/0.4.5/tr31-0.4.5-src.tar.gz"
  sha256 "afc84da2f9ebd999d786ff01368b11c20984b71e3addcc70453407f26370d41c"
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
