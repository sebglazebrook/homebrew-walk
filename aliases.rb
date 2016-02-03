# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Aliases < Formula
  desc "Bash aliases on steroids"
  homepage "https://github.com/sebglazebrook/aliases"
  url "https://github.com/sebglazebrook/aliases/raw/master/releases/0.1.0/mac/aliases.tar.gz"
  version "0.1.0"
  sha256 "ac1b0e31eaca35667fadc21851e70b1e1d7d1edf5d6c6e6ca36aa5ab1b29616e"

  def install
    bin.install "aliases"
    initialize_shell
  end

  def initialize_shell
    shell_profile = [".bash_profile", ".profile"].first { |filename| File.exists?("#{ENV["HOME"]}/#{filename}") }
    if shell_profile
      unless File.readlines("#{ENV["HOME"]}/#{shell_profile}").grep('eval "$(aliases init --global)').size > 0
        `echo 'eval \"$(aliases init --global)\"' >> #{ENV["HOME"]}/#{shell_profile}`
      end
    else
      puts "Binary added to path but could not find shell profile to initialize aliases upon shell initialization."
      puts """
      You need to add the following to your shell profile:

          echo 'eval \"$(aliases init --global)\"' >> ~/.bash_profile

      """
    end
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
