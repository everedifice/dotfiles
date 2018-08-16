# Dotfiles

## Tools

- alacritty with tmux
- spacemacs

## Installation

```shell
cd ~
git clone https://github.com/everedifice/dotfiles.git
ln -s /Users/[me]/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s /Users/[me]/dotfiles/.spacemacs ~/.spacemacs
ln -s /Users/[me]/dotfiles/.tmux.conf ~/.tmux.conf

# install spacemacs
brew tap d12frosted/emacs-plus
brew install emacs-plus --HEAD --with-natural-title-bars
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

# install alacritty with
git clone https://github.com/jwilm/alacritty.git
cd alacritty
make app
cp -r target/release/osx/Alacritty.app /Applications/

#install tmux
brew install tmux --HEAD
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
