#!/bin/bash

#####################################################################
# installdots.sh
# Copies old dotfiles into a backup directory then creates symlinks
# to the new dotfiles
# Inspired from post on http://blog.smalleycreative.com/
#####################################################################

# Define some helper variables
dir=~/dotfiles
olddir=~/dotfiles_old

# Backup old files
echo "Creating $olddir for backup of any existing dotfiles..."
mkdir -p $olddir  # -p makes directory, only if it doesn't exist
echo "...done"
echo "Backing up files..."
mv ~/.vimrc $olddir/
mv ~/.xmobarrc $olddir/
mv ~/.xmonad/xmonad.hs $olddir/
mv ~/.xmonad/getvolume.sh $olddir/
echo "...done"

# Create symlinks 
echo "Creating symlinks..."
mkdir -p ~/.xmonad
ln -s $dir/vimrc ~/.vimrc
ln -s $dir/xmobarrc ~/.xmobarrc
ln -s $dir/xmonad.hs ~/.xmonad/xmonad.hs
ln -s $dir/getvolume.sh ~/.xmonad/getvolume.sh
echo "...done"

