"---------------------------------------------------------------
" VIMPLUG
"---------------------------------------------------------------
" Specify a directory for plugins
call plug#begin("/tmp/vim_r_completion/.nvim/plugged")
" The basics: https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'
source ~/.dotfiles/.nvimrc_base
" Nvim-R: https://github.com/jalvesaq/Nvim-R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable', 'for': ['r', 'R', 'rmd', 'Rmd']} 
source ~/.dotfiles/.nvimrc_nvimr
" Conquer of completion: https://github.com/neoclide/coc.nvim
" Install coc-r-lsp: https://github.com/neoclide/coc-r-lsp
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['vim', 'r', 'R', 'rmd', 'Rmd'], 'do': ':CocInstall coc-r-lsp coc-snippets'}
source ~/.dotfiles/.nvimrc_coc
" Patched fonts for Powerline: https://github.com/powerline/fonts
Plug 'powerline/fonts', {'do': './install.sh'}
" Lean & mean status/tabline for vim: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
source ~/.dotfiles/.nvimrc_airline
" one colorscheme pack to rule them all: https://github.com/flazz/vim-colorschemes
Plug 'flazz/vim-colorschemes'
" Done for all plugins
call plug#end()

