# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Aliases < Formula
  desc "Bash aliases on steroids"
  homepage "https://github.com/sebglazebrook/aliases"
  url "https://github.com/sebglazebrook/aliases/raw/master/releases/0.4.0/mac/aliases.tar.gz"
  version "0.4.0"
  sha256 "0400e641784c3e04519d97b6e3a613108e0950ea143d250055bbb016f395495c"

  def install
    bin.install "aliases"
  end

  def caveats; <<-EOS.undent
    To activate the alias shims add the following to your profile:

      echo 'eval \"$(aliases init --global)\"' >> ~/.bash_profile

    EOS
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
