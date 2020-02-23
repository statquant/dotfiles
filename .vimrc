" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
" completion for R
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'roxma/vim-hug-neovim-rpc'
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
autocmd BufEnter * call ncm2#enable_for_buffer()
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

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

