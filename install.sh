#!/bin/bash

# refer  spf13-vim bootstrap.sh`
KDVIM="$( cd "$( dirname "$0" )" && pwd )"/vim

FOR_VIM=true
FOR_NEOVIM=true
if [ "$1" != "" ]; then
    case $1 in
        --for-vim)
            FOR_VIM=true && FOR_NEOVIM=false && shift
            ;;
        --for-neovim)
            FOR_NEOVIM=true && FOR_VIM=false && shift
            ;;
        --for-all)
            FOR_VIM=true && FOR_NEOVIM=true && shift
            ;;
        *)
            exit 1
            ;;
    esac
fi

echo "Step1: backing up current vim config"
today=`date +%Y%m%d`
if $FOR_VIM; then
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -e $i ] && [ ! -L $i ] && mv $i $i.old; done
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -L $i ] && unlink $i ; done
fi
if $FOR_NEOVIM; then
    for i in $HOME/.config/nvim $HOME/.config/nvim/init.vim; do [ -e $i ] && [ ! -L $i ] && mv $i $i.old; done
    for i in $HOME/.config/nvim/init.vim $HOME/.config/nvim; do [ -L $i ] && unlink $i ; done
fi
rm -rf $KDVIM/autoload

echo "Step2: setting up symlinks"

ln -sf "$KDVIM" "$HOME/.vim"
if $FOR_VIM; then
    echo "source ~/.vim/init.vim" > $HOME/.vimrc
fi
if $FOR_NEOVIM; then
    ln -sf "$KDVIM" "$HOME/.config/nvim"
fi

echo "Step3: update/install plugins using Vim-plug"
system_shell=$SHELL
export SHELL="/bin/sh"
if $FOR_VIM; then
    vim -u $KDVIM/vimrc.bundles +PlugInstall! +PlugClean! +qall
else
    nvim -u $KDVIM/vimrc.bundles +PlugInstall! +PlugClean! +qall 
fi
export SHELL=$system_shell


# echo "Step4: compile YouCompleteMe"
# echo "It will take a long time, just be patient!"
# echo "If error,you need to compile it yourself"
# echo "cd $KDVIM/bundle/YouCompleteMe/ && python install.py --clang-completer"
# # for anaconda python
# hash conda 2>/dev/null && conda install libgcc
# cd $KDVIM/bundle/YouCompleteMe/
# git submodule update --init --recursive
# python install.py --clang-completer
# 
echo "Install Done!"
