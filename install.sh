#!/usr/bin/env bash

# install tmux
brew install tmux --HEAD
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install iterm2-nightly
brew tap caskroom/versions
brew cask install iterm2-nightly

ln -s .tmux.conf ~/.tmux.conf
ln -s .vimrc ~/.vimrc
