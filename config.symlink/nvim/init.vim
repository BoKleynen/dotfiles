syntax on
set nocompatible
set shell=/bin/zsh
set number
set relativenumber
set showmatch
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set clipboard=unnamedplus

filetype off

call plug#begin()


Plug 'editorconfig/editorconfig-vim'

Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

" Semantic language support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'

Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'

call plug#end()

autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silentrly = 0

filetype plugin indent on

au Filetype rust set colorcolumn=100

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


