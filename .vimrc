" Specify a directory for plugins
" At the time of writing vim-plug must be install doing 
" bash) curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
" The basics: https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'
" Nvim-R: https://github.com/jalvesaq/Nvim-R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable', 'for': ['r', 'R', 'rmd', 'Rmd']} 
" Conquer of completion: https://github.com/neoclide/coc.nvim
" Install coc-r-lsp: https://github.com/neoclide/coc-r-lsp
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['vim', 'r', 'R', 'rmd', 'Rmd'], 'do': ':CocInstall coc-r-lsp coc-snippets'}
" R devtools shortcuts: https://github.com/mllg/vim-devtools-plugin
Plug 'mllg/vim-devtools-plugin', { 'for': ['r', 'rmd', 'rnoweb']}
" Send lines to interpreter: https://github.com/jalvesaq/vimcmdline
Plug 'jalvesaq/vimcmdline'
" Patched fonts for Powerline: https://github.com/powerline/fonts
Plug 'powerline/fonts', {'do': './install.sh'}
" Lean & mean status/tabline for vim: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" File system explorer: https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
" Comment any filetype: https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'
" Fuzzy file finder: https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
" Colorscheme pack: https://github.com/flazz/vim-colorschemes
Plug 'flazz/vim-colorschemes'
" Done for all plugins
call plug#end()

" configuration needs to be after plug#end because rtp is not set within
" #begin/#end
source ~/.dotfiles/.vimrc_base
source ~/.dotfiles/.vimrc_nvimr
source ~/.dotfiles/.vimrc_coc
source ~/.dotfiles/.vimrc_devtools
source ~/.dotfiles/.nvimrc_vimcmdline
source ~/.dotfiles/.vimrc_airline
source ~/.dotfiles/.vimrc_nerd
source ~/.dotfiles/.vimrc_ctrlp
source ~/.dotfiles/.vimrc_colorscheme
