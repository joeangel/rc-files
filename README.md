
# Install

## Mac
At your home directory run

```
curl https://raw.githubusercontent.com/joeangel/rc-files/master/setup.sh | bash
```

Your origin rc-files will move to rc_backup

### Install Bash git completion

https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion

### install vim plugins

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
brew install ctags-exuberant
```

in vim, run:

```
:BundleInstall
```

### vim ctags usage

```
ctags -R --exclude=@.ctagsignore .
```

### vim javascript ctag

ref: [js ctags使用(vim)](https://www.twblogs.net/a/5b9fe2202b71771a4da842de)

install

```
npm install -g git+https://github.com/ramitos/jsctags.git
```
usage

```
find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | LANG=C sort > tags
```

## Ubuntu

### Setup
At your home directory run

```
curl https://raw.githubusercontent.com/joeangel/rc-files/master/setup_ubuntu.sh | bash
```

Your origin rc-files will move to rc_backup.

### install vim plugins

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt-get install exuberant-ctags
```

in vim, run:

```
:BundleInstall
```

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
export LANGUAGE=
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL=
```

```
sudo locale-gen zh_TW.UTF-8
# sudo dpkg-reconfigure locales
```

## nvm

https://github.com/creationix/nvm#manual-install

# TODO

1. Merge [HackPad: Mac Init](https://dd-tech.hackpad.com/Mac-init.-lfLWcLQ1JPB) to READEME.md
2. check os for custom setup.sh and .bashrc
```
# ref: http://stackoverflow.com/a/8597411
if [[ "$OSTYPE" == "linux-gnu" ]]; then
# ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
# Mac OSX
elif [[ "$OSTYPE" == "cygwin" ]]; then
# POSIX compatibility layer and Linux environment emulation for Windows
  elif [[ "$OSTYPE" == "msys" ]]; then
# Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  elif [[ "$OSTYPE" == "win32" ]]; then
# I'm not sure this can happen.
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
# ...
  else
# Un
```

