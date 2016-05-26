#!/bin/bash

cd
git clone https://github.com/joeangel/rc-files.git

# backup origin rc-files
mkdir -p ~/rc_backup
cd ~/rc-files
find . -maxdepth 1 ! -path . ! -path ./.git ! -path ./setup.sh ! -path ./README.md -exec mv .{} ../rc_backup/. \;

# move ~/rc-files/* to ~/
cd
find rc-files/ -maxdepth 1 ! -path rc-files/ ! -path rc-files/.git ! -path rc-files/.gitignore ! -path rc-files/setup.sh -exec ln -s {} . \;
