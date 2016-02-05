# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Aliases < Formula
  desc "Bash aliases on steroids"
  homepage "https://github.com/sebglazebrook/aliases"
  url "https://github.com/sebglazebrook/aliases/raw/master/releases/0.2.0/mac/aliases.tar.gz"
  version "0.2.0"
  sha256 "b711b323474a5ca3ab0f883d18a4037883f17f215d5901353263bd30a6281999"

  def install
    bin.install "aliases"
    initialize_shell
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

  private

  def initialize_shell
    if shell_profile_path
      unless shell_already_initialized?
        `printf '\n# Added during installation of 'aliases'\neval \"$(aliases init --global)\"\n' >> #{shell_profile_path}`
      end
    else
      puts "Binary added to path but could not find shell profile to initialize aliases upon shell initialization."
      puts """
      You need to add the following to your shell profile:

          echo 'eval \"$(aliases init --global)\"' >> ~/.bash_profile

      """
    end
  end

  def shell_profile_path
    return @shell_profile_path if @shell_profile_path
    shell_filename = [".bash_profile", ".profile"].first { |filename| File.exists?("#{user_home}/#{filename}") }
    @shell_profile_path = "#{user_home}/#{shell_filename}" if shell_filename
  end

  def user_home
    @user_home ||= "/Users/#{`whoami`.strip}"
  end

  def shell_already_initialized?
    !File.readlines(shell_profile_path).grep(/eval "\$\(aliases init --global\)/).empty?
  end

end
