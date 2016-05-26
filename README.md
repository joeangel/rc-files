
# Install

## Mac
At your home directory run

```
curl https://raw.githubusercontent.com/joeangel/rc-files/master/setup.sh | bash
```

Your origin rc-files will move to rc_backup

### Install Bash git completion

https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion

### vim

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt-get install exuberant-ctags
```

in vim, run:

```
:BundleInstall
```

## Ubuntu

### Setup
At your home directory run

```
curl https://raw.githubusercontent.com/joeangel/rc-files/master/setup_ubuntu.sh | bash
```

Your origin rc-files will move to rc_backup.

### Install nvm

```
curl https://raw.githubusercontent.com/joeangel/rc-files/master/install_nvm_ubuntu.sh | bash
```

## LANG

Delete from ~/.bashrc or ~/.bashprofile

```
LANGUAGE=en_US:en
LANG=en_US.UTF-8
```

Add in ~/.bashrc

```
export LC_ALL="en_US.UTF-8"
```

```
sudo locale-gen zh_TW.UTF-8
sudo dpkg-reconfigure locales
```

## nvm

https://github.com/creationix/nvm#manual-install

# TODO

1. Merge [HackPad: Mac Init](https://dd-tech.hackpad.com/Mac-init.-lfLWcLQ1JPB) to READEME.md

