" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

let nvimrc_use_ncm2 = 0
if nvimrc_use_ncm2 == 1
	Plug 'ncm2/ncm2'
	" Wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'roxma/nvim-yarp'
	Plug 'gaalcaras/ncm-R', {'for': ['r', 'rmd', 'rnoweb']}
endif
let nvimrc_use_nvimr = 1
if nvimrc_use_nvimr == 1
	" R completion
	Plug 'jalvesaq/Nvim-R'
endif

let nvimrc_use_rest = 0
if nvimrc_use_rest == 1
	" ALE linter useful with R
	Plug 'w0rp/ale'
	" R devtools shortcuts
	Plug 'mllg/vim-devtools-plugin', { 'for': ['r', 'rmd', 'rnoweb']}
	" Snippets R
	Plug 'ncm2/ncm2-ultisnips'
	" Track the engine.
	Plug 'SirVer/ultisnips'
	" Snippets are separated from the engine. Add this if you want them:
	Plug 'honza/vim-snippets'
	" Terminal for python, q, ...
	Plug 'jalvesaq/vimcmdline'
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
endif

call plug#end()
