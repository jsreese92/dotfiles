### Configuration settings for various environments and machines

#### Instructions to clone directory
* "git init" (in home directory)
* "git remote add origin git@github.com:jsreese92/dotfiles.git"
* set up rsa key as explained here: https://help.github.com/articles/generating-ssh-keys
* git pull origin master
* git submodule add git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
* follow instructions in the oh-my-zsh repository for setting it up (https://github.com/robbyrussell/oh-my-zsh#setup)
* ln -s ~/.zsh_custom/jreese.zsh ~/.oh-my-zsh/custom/
* ln -s ~/.zsh_custom/themes ~/.oh-my-zsh/custom/themes

#### Machines currently synced
* My MacbookPro
* Windows VM at work running Cygwin
* Ubuntu 12.04 Desktop VM at work

#### TODO
* Write script to create necessary directories and pull from repositories I'm using
to set up a new machine more easily
