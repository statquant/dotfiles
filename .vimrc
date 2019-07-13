" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" completion for R
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

" Vim 8 only
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Optional: for snippet support
" Further configuration might be required, read below
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips'

" Optional: better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'
Plug 'gaalcaras/ncm-R'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Elegant buffer explorer - takes very little screen space http://fholgado.com/minibufexpl 
Plug 'fholgado/minibufexpl.vim'
Plug 'kien/ctrlp.vim'
" Patched fonts for Powerline users (need to run ./install.sh on installation) 
Plug 'powerline/fonts'
" Lean & mean status/tabline for vim that's light as air 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" one colorscheme pack to rule them all! 
Plug 'flazz/vim-colorschemes'
" Another theme
Plug 'altercation/vim-colors-solarized'
" Initialize plugin system
"Plug 'jalvesaq/vimcmdline'
"Plug 'statquant/vimcmdline-1'
Plug '~/CodeProjects/vim/vimcmdline-1'
call plug#end()

" source basic vimrc
source ~/.vimrc_1
" source plugin vimrc
source ~/.vimrc_plugin

