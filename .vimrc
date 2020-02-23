" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'jalvesaq/Nvim-R'
" completion for R
Plug 'autozimu/LanguageClient-neovim'  , {'branch': 'next', 'do': 'bash install.sh'}
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Elegant buffer explorer - takes very little screen space http://fholgado.com/minibufexpl 
Plug 'fholgado/minibufexpl.vim'
" Patched fonts for Powerline users (need to run ./install.sh on installation) 
Plug 'powerline/fonts'
" Lean & mean status/tabline for vim that's light as air 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" one colorscheme pack to rule them all! 
Plug 'flazz/vim-colorschemes'
" Another theme
Plug 'altercation/vim-colors-solarized'
call plug#end()

" source basic vimrc
source ~/.vimrc_1
" source plugin vimrc
source ~/.vimrc_plugin

