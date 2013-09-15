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
mv ~/.stalonetrayrc $olddir/
mv ~/.xmonad/startxmonad.sh $olddir/
mv ~/.bashrc $olddir/
mv ~/.bash_profile $olddir/
echo "...done"

# Create symlinks 
echo "Creating symlinks..."
mkdir -p ~/.xmonad
ln -s $dir/vimrc ~/.vimrc
ln -s $dir/xmobarrc ~/.xmobarrc
ln -s $dir/xmonad.hs ~/.xmonad/xmonad.hs
ln -s $dir/getvolume.sh ~/.xmonad/getvolume.sh
ln -s $dir/stalonetrayrc ~/.stalonetrayrc
ln -s $dir/startxmonad.sh ~/.xmonad/startxmonad.sh
ln -s $dir/bashrc ~/.bashrc
ln -s $dir/bash_profile ~/.bash_profile
echo "...done"

# Install gvim stuff
echo "Install gvim stuff..."
# 1: Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
# 2: Install solarized
rm -rf ~/.vim/bundle/vim-colors-solarized
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
# 3: Install base-16
rm -rf ~/.vim/bundle/base16-vim
git clone git://github.com/chriskempson/base16-vim.git ~/.vim/bundle/base16
# 4: Install julia-vim
rm -rf ~/.vim/bundle/julia-vim
git clone git://github.com/JuliaLang/julia-vim.git ~/.vim/bundle/julia-vim
# 5: Install desert
mkdir -p ~/.vim/bundle/desert/colors
git clone git://github.com/fugalh/desert.vim.git ~/.vim/bundle/desert/colors
echo "...done"
