" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Explore dirs
Plug 'scrooloose/nerdtree'
" Comment the shit out of it
Plug 'scrooloose/nerdcommenter'
" R devtools shortcuts
Plug 'mllg/vim-devtools-plugin', { 'for': ['r', 'rmd', 'rnoweb']}
" R power
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmd', 'rnoweb']}
" Elegant buffer explorer - takes very little screen space http://fholgado.com/minibufexpl 
Plug 'fholgado/minibufexpl.vim'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim. 
Plug 'ctrlpvim/ctrlp.vim'
" Patched fonts for Powerline users (need to run ./install.sh on installation) 
Plug 'powerline/fonts'
" Lean & mean status/tabline for vim that's light as air 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" one colorscheme pack to rule them all! 
Plug 'flazz/vim-colorschemes'
" Another theme
Plug 'altercation/vim-colors-solarized'
" Send lines to interpreter 
Plug 'jalvesaq/vimcmdline'
 
" 2020-12-13 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 2020-12-13 
" Does not seem to work out pf the box
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
 
" Done for all plugins
call plug#end()

" source configuation files
source ~/.vimrc_base
source ~/.vimrc_coc
source ~/.vimrc_ctrlp
source ~/.vimrc_mbe
source ~/.vimrc_nvimr
source ~/.vimrc_nerd
source ~/.vimrc_devtools
"source ~/.vimrc_ycm
"source ~/.vimrc_lcn

