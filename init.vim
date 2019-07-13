" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
			\ 'name' : 'css',
			\ 'priority': 9,
			\ 'subscope_enable': 1,
			\ 'scope': ['css','scss'],
			\ 'mark': 'css',
			\ 'word_pattern': '[\w\-]+',
			\ 'complete_pattern': ':\s*',
			\ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
			\ })
" R completion
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

" Optional: for snippet support
" Further configuration might be required, read below
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips'

" Optional: better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'
" Terminal for python, q, ...
" Plug 'jalvesaq/vimcmdline'
Plug '~/CodeProjects/vim/vimcmdline_fork'
"
Plug 'fholgado/minibufexpl.vim'
" Beautiful statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
Plug 'scrooloose/nerdcommenter'
" R devtools shortcuts
Plug 'mllg/vim-devtools-plugin', { 'for': ['r', 'rmd', 'rnoweb']}
" Nice utility to zoom on a buffer like in tmux ctrl A + z
" Type Ctrl w + o to zoom in and out
Plug 'troydm/zoomwintab.vim'

" Initialize plugin system
call plug#end()

">>>>>>>>>>>>>>>
" general stuff
">>>>>>>>>>>>>>>

" change buffer without saving
set hidden

" navigate buffer
nmap <c-S-left> :bprevious <CR>
nmap <c-S-right> :bnext <CR>

" navigate window
map <c-left> <c-w>h
map <c-right> <c-w>l
map <c-up> <c-w>k
map <c-down> <c-w>j
imap <c-left> <esc><c-w>h<esc>i
imap <c-right> <esc><c-w>l<esc>i
imap <c-up> <esc><c-w>k<esc>i
imap <c-down> <esc><c-w>j<esc>i
tmap <c-left> <esc><c-w>h<esc>i
tmap <c-right> <esc><c-w>l<esc>i
tmap <c-up> <esc><c-w>k<esc>i
tmap <c-down> <esc><c-w>j<esc>i

">>>>>>>>>>>>>>
" plugins
">>>>>>>>>>>>>>

"=========
" Nvim-R
"=========

" send R selection
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" split horizontally
let R_rconsole_width = 0

"=============
" vim-airline
"=============

" vim airline symbols
let g:airline_powerline_fonts = 1
" vim airline theme, list available https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme = 'molokai'

"============
" vimcmdline 
"============

" mappings
let cmdline_map_start          = '<LocalLeader>rf'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = '<LocalLeader>p'
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_quit           = '<LocalLeader>rq'
let cmdline_app           = {}
