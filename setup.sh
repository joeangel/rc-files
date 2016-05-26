#!/bin/bash

exists() { [ ! -z `which "$1"` ]; }
# or: exists() { type -t "$1" > /dev/null 2>&1; }

# install homebrew if it is not exixts
# http://brew.sh/
if ! exists brew; then
	echo 'Homebrew not found! install it!'
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install useful tool
brew install git ack tmux jq mtr bash-completion
# brew install gcc cmake
# brew install jpegoptim
# brew install ffmpeg
# brew install dnsmasq mysql nvm

# clone rc-files
cd
git clone https://github.com/joeangel/rc-files.git

# backup origin rc-files
mkdir -p ~/rc_backup
cd ~/rc-files
find . -maxdepth 1 ! -path . ! -path ./.git ! -path ./setup.sh ! -path ./README.md -exec mv .{} ../rc_backup/. \;

# move ~/rc-files/* to ~/
cd
find rc-files -maxdepth 1 ! -path rc-files ! -path rc-files/.git ! -path rc-files/.gitignore ! -path rc-files/setup.sh ! -path rc-files/README.md ! -path rc-files/setup_ubuntu.sh ! -path rc-files/install_nvm_ubuntu.sh -exec ln -s {} . \;

source ~/.bashrc

echo "1) Update ~/.bashrc for PS1 string"
echo "2) Then, source ~/.bashrc"

