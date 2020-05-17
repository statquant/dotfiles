" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'jalvesaq/Nvim-R'
" completion for R
"Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
"Plug 'Shougo/deoplete.nvim', {'commit': 'e897e01'}
Plug 'ncm2/ncm2'
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'gaalcaras/ncm-R', {'for': ['r', 'rmd', 'rnoweb']}
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

