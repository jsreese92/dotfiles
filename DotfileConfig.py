#!/usr/bin/env python

import sys
from subprocess import call
from shutil import rmtree
from os import remove

def printHelp():
  print "Usage: DotfileConfig.py --[init,clean]"

if __name__ == "__main__":
  # print "Argument list: ", str(sys.argv)
  if (len(sys.argv) < 2):
    printHelp()
  elif (len(sys.argv) > 2):
    printHelp()
  else:
    if (str(sys.argv[1]) == "--init"):
      print "Initialzing all config files"
      # comment this out for now, but switches to home directory
      # print "changing to home directory"
      # call(["cd", "~"])

      print "Initialzing dotfiles from my git repo"
      call (["git", "init"])
      call (["git", "remote", "add", "origin", "git@github.com:jsreese92/dotfiles.git"])
      call (["git", "pull", "origin", "master"])

      print "Cloning oh-my-zsh to ~/.oh-my-zsh"
      call (["git", "clone", "git://github.com/robbyrussell/oh-my-zsh.git", ".oh-my-zsh"])
      call (["cp", ".oh-my-zsh/templates/zshrc.zsh-template", ".zshrc"])

      print "Setting up pathogen"
      call (["mkdir", "-p", ".vim/autoload/pathogen.vim"])
      call (["curl", "-LSso", ".vim/autoload/pathogen.vim", "https://tpo.pe/pathogen.vim"])

      print "Setting up NERDtree"
      call (["git", "clone", "git://github.com/scrooloose/nerdtree.git", ".vim/bundle/nerdtree"])

      # put symlinks to point to custom zsh stuff
      call (["cd", ".oh-my-zsh/custom"])
      call (["ln", "-s", "!/.zsh_custom/jreese.zsh"])
      call (["ln", "-s", "!/.zsh_custom/themes"])

    # TODO: should probably make this a little safer
    elif (str(sys.argv[1]) == "--clean"):
      # print "changing to home directory"
      # call(["cd", "~"])

      print "Resetting all config files"
      rmtree("./.git", ignore_errors=True)
      rmtree("./.vim/colors", ignore_errors=True)
      rmtree("./.vim/bundle/taglist", ignore_errors=True)
      rmtree("./.vim/bundle/nerdtree", ignore_errors=True)
      rmtree("./.zsh_custom", ignore_errors=True)
      rmtree("./.oh-my-zsh", ignore_errors=True)

      filesToDeleteList = ["./.gitignore", "./.gitmodules", "./.gnome-terminal-zenburn.sh", 
          "./.minttyrc", "./.tmux.conf", "./.vimrc", "./.zenburn.vssettings", "./README.md",
          "./.vim/after/plugin/noAutoComments.vim", "./.vim/autoload/pathogen.vim",
          "./.zshrc"] 
      for f in filesToDeleteList:
        try: 
          remove(f)
        except OSError:
          pass

    else:
      printHelp()
