#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/dotfiles                    # dotfiles directory
files="vimrc tmux.conf"    # list of files/folders to symlink in homedir
##########

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# create directory to save backup and undo data
echo "Create backup and undo directory"
cd $dir
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# append custom script to zshrc
cat zshrc >> ~/.zshrc
