
# Install

## Mac
At your home directory run

```
curl https://raw.githubusercontent.com/joeangel/rc-files/master/setup.sh | bash
```

Your origin rc-files will move to rc_backup

## Ubuntu 

At your home directory run

```
# (not ready)
curl https://raw.githubusercontent.com/joeangel/rc-files/master/setup.sh | bash
```

Your origin rc-files will move to rc_backup

```
sudo apt-get install tmux ctags grep-ack
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

in vim

```
:BundleInstall
```


## Basic

```
sudo apt-get install git jq tmux aptitude grep-ack
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

## vim

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt-get install exuberant-ctags
```

in vim, run:

```
:BundleInstall
```

## nvm

https://github.com/creationix/nvm#manual-install

# TODO

1. Merge [HackPad: Mac Init](https://dd-tech.hackpad.com/Mac-init.-lfLWcLQ1JPB) to READEME.md
