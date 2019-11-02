# Dotfiles

This repository contains dotfiles for

* i3
* Rofi
* Polybar
* Oh-my-zsh
* fzf
* feh
* vim
* termite

## Depencencies

## Install

This repository is setup as a explained here. In order to install these dotfiles on a new machine, just do

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/harrypuuter/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

### Tools

For zsh, a few extra pugins are used:
```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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
