" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'

" Wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R', {'for': ['r', 'rmd', 'rnoweb']}

" R completion
Plug 'jalvesaq/Nvim-R'
" Better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'
" ALE linter useful with R
Plug 'w0rp/ale'
"Plug '~/CodeProjects/vim/ale'
" R devtools shortcuts
Plug 'mllg/vim-devtools-plugin', { 'for': ['r', 'rmd', 'rnoweb']}

"Plug '~/CodeProjects/vim/vim-snippets'
" Snippets R
Plug 'ncm2/ncm2-ultisnips'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Terminal for python, q, ...
" Plug 'jalvesaq/vimcmdline'
Plug '~/CodeProjects/vim/vimcmdline_fork'

" Buffer explorer
Plug 'fholgado/minibufexpl.vim'

" Beautiful statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Comments
Plug 'scrooloose/nerdcommenter'

" Nice utility to zoom on a buffer like in tmux ctrl A + z
" Type Ctrl w + o to zoom in and out
Plug 'troydm/zoomwintab.vim'

" Vim plugin for editing Jupyter ipynb files via jupytext
Plug 'goerz/jupytext.vim'

" Initialize plugin system
call plug#end()

">>>>>>>>>>>>>>>
" general stuff
">>>>>>>>>>>>>>>

" tab behaviour
" smarttab is the width of a hard tabstop measured in "spaces" effectively the (maximum) width of an actual tab character.
set tabstop=8 
" Setting tabstop to a non-zero value other than tabstop will make the tab key (in insert mode) insert a combination of spaces (and possibly tabs) to simulate tab stops at this width.
set softtabstop=0 
" Enabling softtabstop this will make the tab key (in insert mode) insert spaces instead of tab characters. This also affects the behavior of the retab command.
set expandtab 
" shiftwidth is the size of an "indent". It's also measured in spaces, so if your code base indents with tab characters then you want shiftwidth to equal the number of tab characters times tabstop.
" This is also used by things like the =, > and < commands.
set shiftwidth=4 
" Enabling smarttab this will make the tab key (in insert mode) insert spaces or tabs to go to the next indent of the next tabstop when the cursor is at the beginning of a line (i.e. the only preceding characters are whitespace).
set smarttab

" change buffer without saving
set hidden

" navigate buffer
nmap <c-S-left> :bprevious <CR>
nmap <c-S-right> :bnext <CR>

" navigate window
nnoremap <c-left> <c-w>h<esc>i
nnoremap <c-right> <c-w>l<esc>i
nnoremap <c-up> <c-w>k<esc>i
nnoremap <c-down> <c-w>j<esc>i
inoremap <c-left> <esc><c-w>h<esc>i
inoremap <c-right> <esc><c-w>l<esc>i
inoremap <c-up> <esc><c-w>k<esc>i
inoremap <c-down> <esc><c-w>j<esc>i
tmap <c-left> <esc><c-w>h<esc>i
tmap <c-right> <esc><c-w>l<esc>i
tmap <c-up> <esc><c-w>k<esc>i
tmap <c-down> <esc><c-w>j<esc>i

" come back to previous position
" nnoremap <c-[> <c-t>
" inoremap <c-[> <c-t>

">>>>>>>>>>>>>>
" plugins
">>>>>>>>>>>>>>

"=========
" ncm2
"=========

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. 
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<CR>"

"=========
" Nvim-R
"=========

" send R selection
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" split horizontally
let R_rconsole_width = 0
" classic <- shortcut
let R_assign_map = '<M-->'
" set some tag dir
autocmd FileType r set tags+=~/.cache/Nvim-R/Rtags,~/.rtags/base_pkg.ctags
autocmd FileType rnoweb set tags+=~/.cache/Nvim-R/Rtags,~/.rtags/base_pkg.ctags

"=========
" ALE
"=========
let g:ale_fixers = {'r': ['styler'], 'rmd': ['styler']}
" default rules for the r linting (see https://github.com/jimhesner/lintr#available-linters)
let g:ale_r_lintr_options = 'with_defaults(line_length_linter(120))'

"===============
" ncm2-ultiSnips
"===============
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" <tab> to move to next placeholder in snippet
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<Tab>"
let g:UltiSnipsJumpBackwardTrigger	= "<S-Tab>"
let g:UltiSnipsRemoveSelectModeMappings = 0

"=============
" vim-devtools
"=============

"RBuildPackage <dir>: Runs devtools::build.
inoremap <LocalLeader>zb <esc>:RBuildPackage<CR>i
nnoremap <LocalLeader>zb <esc>:RBuildPackage<CR>
tnoremap <LocalLeader>zb <esc>:RBuildPackage<CR>i
"RLoadPackage <dir>: Runs devtools::load_all.
inoremap <LocalLeader>zl <esc>:RLoadPackage<CR>i
nnoremap <LocalLeader>zl <esc>:RLoadPackage<CR>
tnoremap <LocalLeader>zl <esc>:RLoadPackage<CR>i
"RUnloadPackage <dir>: Runs devtools::unload.
inoremap <LocalLeader>zu <esc>:RUnloadPackage<CR>i
nnoremap <LocalLeader>zu <esc>:RUnloadPackage<CR>
tnoremap <LocalLeader>zu <esc>:RUnloadPackage<CR>i
"RDocumentPackage <dir>: Runs devtools::document
inoremap <LocalLeader>zd <esc>:RDocumentPackage<CR>i
nnoremap <LocalLeader>zd <esc>:RDocumentPackage<CR>
tnoremap <LocalLeader>zd <esc>:RDocumentPackage<CR>i
"RCheckPackage <dir>: Runs devtools::check.
inoremap <LocalLeader>zc <esc>:RCheckPackage<CR>i
nnoremap <LocalLeader>zc <esc>:RCheckPackage<CR>
tnoremap <LocalLeader>zc <esc>:RCheckPackage<CR>i
"RTestPackage <dir> <filter>: Runs devtools::test using specified filter (default '').
inoremap <LocalLeader>zt <esc>:RTestPackage<CR>i
nnoremap <LocalLeader>zt <esc>:RTestPackage<CR>
tnoremap <LocalLeader>zt <esc>:RTestPackage<CR>i
"RMakePackage <dir>: Runs devtools::document, then devtools::install.
inoremap <LocalLeader>zz <esc>:RMake<CR>i
nnoremap <LocalLeader>zz <esc>:RMake<CR>
tnoremap <LocalLeader>zz <esc>:RMake<CR>i
"RBuildPackgeTags <dir>: Builds a tag file for the package and stores it in g:devtools_rtags_dir (default is "~/.rtags"). All tag files in this directory will automatically added to &tags for file types r, rnoweb and rmd.
inoremap <LocalLeader>z] <esc>:RBuildPackageTags<CR>i
nnoremap <LocalLeader>z] <esc>:RBuildPackageTags<CR>
tnoremap <LocalLeader>z] <esc>:RBuildPackageTags<CR>i

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

"==========
" jupytext
" =========
let g:jupytext_fmt = 'rmarkdown'
let g:jupytext_filetype_map = {'rmarkdown': 'r'}
