let s:plug_dir = "~/.config/nvim/plugged"

call plug#begin(s:plug_dir)
" Configs for the Nvim LSP client (:help lsp).
Plug 'neovim/nvim-lspconfig'
" nvim-cmp source for neovim's built-in language server client.
Plug 'hrsh7th/cmp-nvim-lsp'
" A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
Plug 'hrsh7th/nvim-cmp'
" nvim-cmp source for vim-vsnip.
Plug 'hrsh7th/cmp-vsnip'
" VSCode(LSP)'s snippet feature in vim/nvim.
Plug 'hrsh7th/vim-vsnip'
" This plugin provides some plugins integration.
Plug 'hrsh7th/vim-vsnip-integ'
" Snippets collection for a set of different programming languages.
Plug 'rafamadriz/friendly-snippets'
" Vim plugin to work with R.
Plug 'jalvesaq/Nvim-R'
" Completion source for nvim-cmp using Nvim-R as backend.
Plug 'jalvesaq/cmp-nvim-r', { 'branch': 'space' }
" This tiny plugin adds vscode-like pictograms to neovim built-in lsp.
Plug 'onsails/lspkind.nvim'
" vimcmdline: Send lines to interpreter.
Plug 'jalvesaq/vimcmdline'
" Patched fonts for Powerline.
Plug 'powerline/fonts', {'do': './install.sh'}
" Lean & mean status/tabline for vim.
Plug 'vim-airline/vim-airline'
" Official theme repository for vim-airline.
Plug 'vim-airline/vim-airline-themes'
" Colorscheme pack.
Plug 'flazz/vim-colorschemes'
" Done for all plugins
call plug#end()

lua <<EOF
  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  
  -- Set up nvim-cmp.
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- the truncated part when popup menu exceed maxwidth
            before = function(entry, item)
                local menu_icon = {
                    nvim_lsp = '',
                    vsnip = '',
                    cmp_nvim_r = 'R'
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        })
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
      ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'cmp_nvim_r' },
      }, {
      { name = 'buffer' },
    })
  })


  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  local cmp_nvim_r = require('cmp')
  cmp_nvim_r.setup({
    filetypes = {'r', 'rmd', 'R', 'Rmd', 'quarto'},
    doc_width = 58
  })
EOF

source ${HOME}/.dotfiles/.nvimrc_base
source ${HOME}/.dotfiles/.nvimrc_nvimr
source ${HOME}/.dotfiles/.nvimrc_vimcmdline
source ${HOME}/.dotfiles/.nvimrc_airline
source ${HOME}/.dotfiles/.nvimrc_colorscheme
