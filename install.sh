#!/usr/bin/env bash

# install spacemacs
brew tap d12frosted/emacs-plus
brew install emacs-plus --HEAD
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

# install tmux
brew install tmux --HEAD
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install iterm2-nightly
brew tap caskroom/versions
brew cask install iterm2-nightly

ln -s .spacemacs ~/.spacemacs
ln -s .tmux.conf ~/.tmux.conf
ln -s .vimrc ~/.vimrc
