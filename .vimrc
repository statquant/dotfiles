"---------------------------------------------------------------
" WINDOWS SPECIAL
"---------------------------------------------------------------
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc

set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/statquantPlugin
call vundle#begin()

" Vundle is the plugin manager
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/Align'
" Nvim-R plugin for close tmux/screen/vim/R interaction
Plugin 'jalvesaq/Nvim-R'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" Elegant buffer explorer - takes very little screen space http://fholgado.com/minibufexpl 
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kien/ctrlp.vim'
" Patched fonts for Powerline users (need to run ./install.sh on installation) 
Plugin 'powerline/fonts'
" Lean & mean status/tabline for vim that's light as air 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration 
Plugin 'edkolev/tmuxline.vim'
"Plugin 'ervandew/supertab'
" A code-completion engine for Vim http://valloric.github.io/YouCompleteMe/ 
Plugin 'Valloric/YouCompleteMe'
" Generates config files for YouCompleteMe (https://github.com/Valloric/YouCompleteMe) 
Plugin 'rdnetto/YCM-Generator'
" Perform all your vim insert mode completions with Tab 
" Plugin 'ervandew/supertab'
" Plugin 'https://bitbucket.org/alexcolson/kdb-vim.git'
" one colorscheme pack to rule them all! 
Plugin 'flazz/vim-colorschemes'
"  UltiSnips - The ultimate snippet solution for Vim
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Simulate a split shell in vim using gnu screen or tmux 
Plugin 'ervandew/screen'

call vundle#end()

source $HOME/.vimrc_1
source $HOME/.vimrc_plugin
