" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" Fast, Extensible, Async Completion Framework for Neovim
Plug 'roxma/nvim-completion-manager'
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'jalvesaq/Nvim-R', { 'for' : 'r' }
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
Plug 'jalvesaq/vimcmdline'
call plug#end()

" source basic vimrc
source ~/.vimrc_1
" source plugin vimrc
source ~/.vimrc_plugin

