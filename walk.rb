# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Walk < Formula
  desc "Walk a directory and return what you find"
  homepage "https://github.com/sebglazebrook/walk"
  url "https://github.com/sebglazebrook/walk/raw/master/releases/0.1.0/mac/walk.tar.gz"
  version "0.1.0"
  sha256 "0f2eca07fd4b865eff3ee4f3e570745444b61d0ac72a78e33160ddaf7b648866"

  def install
    bin.install "walk"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test aliases`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end

end
