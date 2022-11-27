" Basic settings
source ~/.config/nvim/options.vim
nnoremap <leader>sv :source $VIMRC<CR>

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
 Plug 'sainnhe/sonokai'
 Plug 'davidgranstrom/nvim-markdown-preview'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'Raimondi/delimitMate'
call plug#end()

source ~/.config/nvim/theme.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/markdown.vim
source ~/.config/nvim/treesitter.vim

