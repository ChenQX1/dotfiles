set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " set relative line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=100                 " set an 100 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
" Clipboard settings
set clipboard+=unnamedplus   " using system clipboard
nnoremap dd "_dd
xnoremap dd "_dd
nnoremap dw "_dw
xnoremap dw "_dw

filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set smartcase
set hidden
setlocal noswapfile 
set bufhidden=hide 
set ruler 
set autochdir
set backupcopy=yes
set hlsearch
set noerrorbells
set novisualbell
set t_vb= 
set matchtime=2
set magic
set smartindent
set backspace=indent,eol,start
set cmdheight=2
set laststatus=2
set foldenable
set foldmethod=syntax
set foldcolumn=0
setlocal foldlevel=1

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
syntax on
syntax enable                   " syntax highlighting

" Vim jumps to the last position when reopening the file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

lua << EOF
vim.g.completeopt = "menu,menuone,noselect,noinsert"
vim.wo.signcolumn = "yes"
vim.o.list = true
vim.o.listchars = "space:·"
vim.o.timeoutlen = 500
vim.o.showtabline = 2
EOF
