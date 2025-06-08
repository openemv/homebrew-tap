class EmvUtils < Formula
  desc "EMV libraries and tools"
  homepage "https://github.com/openemv/emv-utils"
  url "https://github.com/openemv/emv-utils/releases/download/0.2.3/emv-utils-0.2.3-src.tar.gz"
  sha256 "26c342d8eacef7764011bc8c8827e0d02f66cda6b8752cf49e7ae955436188e5"
  license all_of: ["LGPL-2.1-or-later", "GPL-3.0-or-later"]
  head "https://github.com/openemv/emv-utils.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "pkgconfig" => :build
  depends_on "boost"
  depends_on "iso-codes"
  depends_on "json-c"
  depends_on "pcsc-lite"
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
      "-DBUILD_EMV_DECODE=YES",
      "-DBUILD_EMV_TOOL=YES",
      "-DBUILD_EMV_VIEWER=YES",
      "-DCMAKE_DISABLE_FIND_PACKAGE_Qt6=YES",
      "-DBUILD_MACOSX_BUNDLE=YES",
      "-DCMAKE_INSTALL_RPATH=#{rpath}"

    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    if OS.mac?
      # Create emv-viewer symlink in bin directory
      bin.install_symlink prefix/"EMV Viewer.app/Contents/MacOS/EMV Viewer" => "emv-viewer"
    end
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      For EMV Viewer to appear in Launchpad, do this:
      ln -s $(brew --prefix emv-utils)/EMV\\ Viewer.app /Applications/
    EOS
  end

  test do
    system "false"
  end
end
