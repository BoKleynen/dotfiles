set shell=/bin/zsh
let mapleader = "\<Space>"

set nocompatible
filetype off

call plug#begin()
" General enhancements
Plug 'editorconfig/editorconfig-vim'

" fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" GUI enhancements
Plug 'itchyny/lightline.vim'

" Semantin language support
Plug 'neovim/nvim-lspconfig' " common configurations for the nvim LSP client

" Syntactic language suppport
Plug 'rust-lang/rust.vim'

" Tools
Plug 'lervag/vimtex'

call plug#end()

lua << EOF
require "bo.config"
EOF

filetype on             " enable filetype detection
filetype plugin on      " load file-specific plugins
filetype indent on      " load file-specific indentation


" Show line numbers
set number

" Show line numbers as relative to the current line
set relativenumber

set autoindent

" Enable mouse support
set mouse=a

" Copy to system clipboard
set clipboard=unnamedplus

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

