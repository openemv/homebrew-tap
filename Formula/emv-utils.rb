class EmvUtils < Formula
  desc "EMV libraries and tools"
  homepage "https://github.com/openemv/emv-utils"
  license "LGPL-2.1-or-later"
  head "https://github.com/openemv/emv-utils.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "pkgconfig" => :build
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
