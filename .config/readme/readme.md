# Dotfiles

This repository contains dotfiles for

* i3
* Rofi
* Polybar
* Oh-my-zsh
* fzf

## Depencencies

In order to get everything running, needed tools are

`is-gaps, rofi, polybar, zsh, oh-my-zsh, fzf`

## Install

This repository is setup as a explained here. In order to install these dotfiles on a new machine, just do

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/harrypuuter/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```



### Fonts

Siji Fonts - https://github.com/stark/siji

```
git clone https://github.com/stark/siji && cd siji

./install.sh -d ~/.fonts
```

Nerd Fonts - https://github.com/ryanoasis/nerd-fonts

```
git clone git@github.com:ryanoasis/nerd-fonts.git fonts && cd fonts

./install.sh Inconsolata
./install.sh Inconsolata LCG
