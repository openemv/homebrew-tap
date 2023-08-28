class Dukpt < Formula
  desc "ANSI X9.24 DUKPT libraries and tools"
  homepage "https://github.com/openemv/dukpt"
  url "https://github.com/openemv/dukpt/releases/download/1.1.0/dukpt-1.1.0-src.tar.gz"
  sha256 "6bcce2507b8a2eb337e6690b2ac6fba4d772b24811c064fb0451f8968c5f6533"
  license all_of: ["LGPL-2.1-or-later", "GPL-3.0-or-later"]
  head "https://github.com/openemv/dukpt.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "mbedtls"
  depends_on "openemv/tap/tr31"
  depends_on "qt@5"
  depends_on "bash-completion" => :recommended
  depends_on "doxygen" => :optional

  on_macos do
    depends_on "argp-standalone" => :build
  end

  def install
    system "cmake", "-S", ".", "-B", "build",
      *std_cmake_args,
      "-DBUILD_SHARED_LIBS=YES",
      "-DBUILD_DUKPT_UI=YES",
      "-DBUILD_MACOSX_BUNDLE=YES",
      "-DCMAKE_INSTALL_RPATH=#{rpath}"

    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    if OS.mac?
      # Create dukpt-ui symlink in bin directory
      bin.install_symlink prefix/"Dukpt.app/Contents/MacOS/Dukpt" => "dukpt-ui"

      # For Dukpt to appear in Launchpad, do this:
      # ln -s $(brew --prefix dukpt)/Dukpt.app /Applications/
    end
  end

  test do
    system "false"
  end
end
