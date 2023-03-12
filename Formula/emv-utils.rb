class EmvUtils < Formula
  desc "EMV libraries and tools"
  homepage "https://github.com/openemv/emv-utils"
  url "https://github.com/openemv/emv-utils/releases/download/0.1.0/emv-utils-0.1.0-src.tar.gz"
  sha256 "7c9b7a9dafe194569b85ed772c22a2297d9b2febeb9779fed7919cf0bade31ba"
  license "LGPL-2.1-or-later"
  head "https://github.com/openemv/emv-utils.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "pkgconfig" => :build
  depends_on "boost"
  depends_on "iso-codes"
  depends_on "json-c"
  depends_on "pcsc-lite"
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
