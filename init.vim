" Font (Fira mono nerd font): https://www.nerdfonts.com/font-downloads

set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""
"
"sets the key <leader> to ","
let mapleader = ","
"

""""""""""fzf settings""""""""""

"Change the default mapping and the default command to invoke CtrlP
set rtp+=~/.fzf

map <c-p> :FZF<cr>

"When invoked, unless a starting directory is specified, CtrlP will set its
"local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

"""""""""""""""""""""""""""""""""""""""""""""""""

" disable compatibility to old-time vi
set nocompatible

" JSON comments
let g:vim_json_warnings=0

"Syntax highlighting, and indent
syntax on
filetype plugin indent on
set autoindent              " indent a new line the same amount as the line just typed

" set the max number of lines (automatically line break at textwidth)
set textwidth=120
" set colour columns for good coding style
set cc=120

" show matching brackets.
set showmatch

" case insensitive matching
set ignorecase

" middle-click paste with mouse
"set mouse=v

" matches nvim clipboard to the default clipboard
set clipboard=unnamedplus

" Modifies the auto-complete menu to behave more like an IDE.
set completeopt=noinsert,menuone,noselect

"prints out a cat whenever you open vim
echo ">^.^<"

"text no longer wraps back around and relative numbers are placed on the side of the file, numberwidth sets the width of columns that the relative numbers take up
set nowrap number numberwidth=1

"remap "jk" to escape insert and visual modes
inoremap jk <esc>
vnoremap jk <esc>

"vim tab settings
set smartindent
set tabstop=2 " number of columns occupied by a tab character
set shiftwidth=2 " width for autoindents
set expandtab " convert tabs to white space
set softtabstop=2 " see multiple spaces as tabstops so <BS> does the right thing

" turn hybrid line numbers on
set number relativenumber
" turn off line numbers for markdown and text files
"autocmd FileType markdown,text,vim set nonumber norelativenumber

" When using j or k to jump relatively, add the jump to the 'jumps' list (can now use CTRL-o and CTRL-i)
" this is really useful for when using relativenumber
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" highlight line numbers
hi CursorLineNr cterm=bold ctermfg=red ctermbg=white
hi LineNr ctermfg=blue ctermbg=white

"Only search relative to the directory of the current file and in the current directory
set path=.,,**

"map ctrl + direction to change window in that direction
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file Ag silent! grep! <args>|botright cwindow|redraw!
nnoremap \ :Ag -s<SPACE>
nnoremap <leader>\ :Ag -s <C-R><C-W>

set switchbuf=vsplit

set wildmenu

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Some search settings
set incsearch "incremental search
set ignorecase
set hlsearch "highlight search

" Press return to temporarily disable hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

" Use the matchit plugin that vim comes with by default
packadd! matchit

" Have autocompletion behave more normally
set wildmode=longest,list,full

" Folding
set foldmethod=syntax
set foldlevelstart=20

"maps <leader>ev to open up the vimrc in a horizontal split (use vsplit for vertical split) think of this as edit vimrc (ev)
nnoremap <leader>ev :tabe $MYVIMRC<cr>

"map <leader>sv to execute the vimrc file, think of this as source vimrc (sv)
nnoremap <leader>sv :source $MYVIMRC<cr>

" NEW SETTINGS:

" inoremap <expr> <TAB> coc#pum#visible() ? coc#_select_confirm() : "\<TAB>"
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set title " Show file title
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim

" Plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LSP: rename variables, smart jump to definition, list references, etc.
"https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
" manage your language servers using Neovim
" Plug 'williamboman/mason.nvim'
" Plug 'williamboman/mason-lspconfig.nvim'

Plug 'lewis6991/gitsigns.nvim' " Fast git decorations (eg Signs for added, removed, and changed lines)
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround' "surroundings: parentheses, brackets, quotes, XML tags, and more

Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'karb94/neoscroll.nvim' " Smooth scrolling
Plug 'vim-test/vim-test' " Testing
Plug 'pbrisbin/vim-mkdir' " Automatically mkdirs on saveas
Plug 'lukas-reineke/indent-blankline.nvim' " adds indentation guides to all lines

Plug 'nvim-tree/nvim-web-devicons' " Add icons to your plugins (requires a nerd font)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Improved highlighting
" Use :TSInstall <language_to_install> to install the parser for a language
Plug 'nvim-lualine/lualine.nvim'
" Plug 'nvim-tree/nvim-tree.lua'
" Plug 'romgrk/barbar.nvim' " Improve tabs
" Plug 'akinsho/toggleterm.nvim', {'tag' : '*'} " A neovim plugin to persist and toggle multiple terminals during an editing session
call plug#end()

" Theme
colorscheme tokyonight-moon

let g:bargreybars_auto=0

" eslint before saving
autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll

lua << END
require('lualine').setup()

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- List of language server setups: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- To know the available options in .setup() checkout the help page using :help lspconfig-setup.
lspconfig.pyright.setup({}) -- Python
lspconfig.tsserver.setup({}) -- Typescript
lspconfig.solargraph.setup({}) -- Ruby
lspconfig.gopls.setup({}) -- Golang
lspconfig.eslint.setup({}) -- ESLint
lspconfig.cssls.setup({ capabilities = capabilities, }) -- CSS

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})

-- load any snippet we have in our runtimepath. 
require('luasnip.loaders.from_vscode').lazy_load()

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp = require('cmp')
local luasnip = require('luasnip')
local select_opts = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    sources = {
      {name = 'path'}, -- Autocomplete file paths.
      {name = 'nvim_lsp', keyword_length = 3}, -- Shows suggestions based on the response of a language server.
      {name = 'buffer', keyword_length = 3}, -- Suggests words found in the current buffer.
      {name = 'luasnip', keyword_length = 2}, -- Shows available snippets and expands them if they are chosen.
    },
    window = { -- Controls the appearance and settings for the documentation window
      documentation = cmp.config.window.bordered()
    },
    formatting = { -- List of strings that determines the order of the elements in an item.
        fields = {'menu', 'abbr', 'kind'}, -- abbr is the content of the suggestion. kind is the type of data, this can be text, class, function, etc. Finally, menu which apparently is empty by default.
        format = function(entry, item) -- Callback function that allows us to customize the appearance of the completion menu.
            local menu_icon = {
              nvim_lsp = 'λ',
              luasnip = '⋗',
              buffer = 'Ω',
              path = 'Ψ',
            }
            item.menu = menu_icon[entry.source.name]
            return item
         end,
    },
    mapping = { -- List of keybindings
        ['<CR>'] = cmp.mapping.confirm({select = false}), -- ['<CR>'] is the key/shortcut we want to bind. The function on the other side of the assignment
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll text in the documentation window
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Scroll text in the documentation window
        ['<C-e>'] = cmp.mapping.abort(), -- Cancel completion
        ['<C-d>'] = cmp.mapping(function(fallback) -- Jump to the next placeholder in the snippet
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, {'i', 's'}),
        ['<C-b>'] = cmp.mapping(function(fallback) -- Jump to the previous placeholder in the snippet
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {'i', 's'}),
        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then -- If the completion menu is visible, move to the next item
            cmp.select_next_item(select_opts)
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then -- If the line is "empty", insert a Tab character
            fallback()
          else -- If the cursor is inside a word, trigger the completion menu.
            cmp.complete()
          end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback) -- If the completion menu is visible, move to the previous item.
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            fallback()
          end
        end, {'i', 's'}),
    },
})

-- Change diagnostic icons
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end
sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})

-- Smooth scroll setup
require('neoscroll').setup()
END

