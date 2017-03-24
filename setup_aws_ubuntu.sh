#!/bin/bash

# install useful tool
sudo apt-get update && sudo apt-get install -y tmux exuberant-ctags ack-grep git jq tmux aptitude bash-completion

# clone rc-files
cd
git clone https://github.com/joeangel/rc-files.git

# backup origin rc-files
mkdir -p ~/rc_backup
cd ~/rc-files
find . -maxdepth 1 ! -path . ! -path ./.git ! -path ./setup.sh ! -path ./README.md -exec mv .{} ../rc_backup/. \;

# move ~/rc-files/* to ~/
cd
find rc-files/ -maxdepth 1 ! -path rc-files/ ! -path rc-files/.git ! -path rc-files/.gitignore ! -path rc-files/setup.sh ! -path rc-files/README.md ! -path rc-files/setup_ubuntu.sh ! -path rc-files/install_nvm_ubuntu.sh -exec ln -s {} . \;

echo 'set-option -g prefix C-n' >> .tmux.conf
mv .bashrc_pure .bashrc

source ~/.bashrc

# install Vundle for vim
cd
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "1) Update ~/.bashrc for PS1 string"
echo "2) Enter vi and type :BundleInstall"
echo "3) Then, source ~/.bashrc"

