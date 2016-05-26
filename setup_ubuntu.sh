#!/bin/bash

# install useful tool
sudo apt-get update && sudo apt-get install -y tmux exuberant-ctags ack-grep git jq tmux aptitude

# clone rc-files
cd
git clone https://github.com/joeangel/rc-files.git

# backup origin rc-files
mkdir -p ~/rc_backup
cd ~/rc-files
find . -maxdepth 1 ! -path . ! -path ./.git ! -path ./setup.sh ! -path ./README.md -exec mv .{} ../rc_backup/. \;

# move ~/rc-files/* to ~/
cd
find rc-files/ -maxdepth 1 ! -path rc-files/ ! -path rc-files/.git ! -path rc-files/.gitignore ! -path rc-files/setup.sh -exec ln -s {} . \;


source ~/.bashrc

# install Vundle for vim
cd
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vi

echo "1) Update ~/.bashrc for PS1 string"
echo "2) Enter vi and type :BundleInstall"
echo "3) Then, source ~/.bashrc"

