# Dotfiles

## Tools

- vim
- tmux
- alacritty
- spacemacs

## Installation

```shell
cd ~
git clone https://github.com/everedifice/dotfiles.git
ln -s /Users/[me]/dotfiles/.spacemacs ~/.spacemacs
ln -s /Users/[me]/dotfiles/.tmux.conf ~/.tmux.conf
ln -s /users/[me]/dotfiles/.vimrc ~/.vimrc

# install spacemacs
brew tap d12frosted/emacs-plus
brew install emacs-plus --HEAD --with-natural-title-bars
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

#install tmux
brew install tmux --HEAD --with-utf8proc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
