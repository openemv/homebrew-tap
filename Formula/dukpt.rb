class Dukpt < Formula
  desc "ANSI X9.24 DUKPT libraries and tools"
  homepage "https://github.com/openemv/dukpt"
  url "https://github.com/openemv/dukpt/releases/download/0.2.5/dukpt-0.2.5-src.tar.gz"
  sha256 "2124dd09dba28236fdd2651c14eda3c6787e9b0489cd2eb8758eb4b24548281b"
  license "LGPL-2.1-or-later"
  head "https://github.com/openemv/dukpt.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "mbedtls@2"
  depends_on "openemv/tap/tr31"
  depends_on "bash-completion" => :recommended
  depends_on "doxygen" => :optional

  on_macos do
    depends_on "argp-standalone" => :build
  end

  def install
    system "cmake", "-S", ".", "-B", "build",
      *std_cmake_args,
      "-DBUILD_SHARED_LIBS=YES",
      "-DCMAKE_INSTALL_RPATH=#{rpath}",
      "-DCMAKE_REQUIRE_FIND_PACKAGE_tr31=YES"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
