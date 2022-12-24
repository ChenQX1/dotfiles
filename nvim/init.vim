" Basic settings
source ~/.config/nvim/options.vim

" Plugin
call plug#begin(stdpath('data') . '/plugged')
 Plug 'scrooloose/nerdtree'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'kaicataldo/material.vim', { 'branch': 'main' }
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'bling/vim-bufferline'
 Plug 'kien/rainbow_parentheses.vim'
 Plug 'scrooloose/nerdcommenter'
 Plug 'junegunn/seoul256.vim'
 Plug 'davidgranstrom/nvim-markdown-preview'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'Raimondi/delimitMate'
 Plug 'voldikss/vim-floaterm'
call plug#end()

let g:floaterm_keymap_new = '<leader>t'
let g:floaterm_keymap_toggle = '<leader>tt'
let g:floaterm_keymap_kill = '<leader>kt'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.9

source ~/.config/nvim/theme.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/markdown.vim
source ~/.config/nvim/treesitter.vim

