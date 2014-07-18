### Configuration settings for various environments and machines


#### How to sync
* NOTE: this only works if I set up an ssh key and add the computer to my github ssh key list. If someone other than me wants to set this up, you can do git clone \<this directory\> and manually do this, or modify DotfileConfig.py
* Download DotfileConfig.py
* mv DotfileConfig.py DotfileConfig_tmp.py
* chmod u+x DotfileConfig_tmp.py
* ./DotfileConfig_tmp.py --init

#### To Remove
* WARNING: This may remove files other than those that came with this repo. 
I've tried to avoid this as much as possible, but there's still some dodgy
stuff if you put code in the same folders as I put mine. Double check
DotfileConfig.py's source code and make sure
* ./DotfileConfig.py --clean

#### Machines currently synced
* My MacbookPro
* Windows VM at work running Cygwin
* Ubuntu 12.04 Desktop VM at work
* Windows local machine at work Cygwin
