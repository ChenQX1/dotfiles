" Basic settings
source ~/.config/nvim/options.vim

" Plugin
call plug#begin(stdpath('data') . '/plugged')
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'kaicataldo/material.vim', { 'branch': 'main' }
 Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
 Plug 'nvim-tree/nvim-tree.lua'
 Plug 'junegunn/seoul256.vim'
 Plug 'sainnhe/everforest'
 Plug 'akinsho/bufferline.nvim'
 Plug 'moll/vim-bbye'
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'kien/rainbow_parentheses.vim'
 Plug 'scrooloose/nerdcommenter'
 Plug 'davidgranstrom/nvim-markdown-preview'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'Raimondi/delimitMate'
 Plug 'voldikss/vim-floaterm'
 Plug 'xiyaowong/nvim-transparent'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-lua/plenary.nvim'
call plug#end()

source ~/.config/nvim/theme.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/markdown.vim
source ~/.config/nvim/plugins/floaterm.vim

lua << EOF

require('keybindings')
require('plugin-config.nvimtree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.nvim-treesitter')

EOF
