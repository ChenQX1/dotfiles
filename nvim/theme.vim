if (has("termguicolrs"))
    set termguicolors
endif

set background=dark


"let g:material_terminal_italics = 0
"" default, ocean, palenight
"let g:material_theme_style = "default-community"
"colorscheme material
"colorscheme seoul256

let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
colorscheme everforest
let g:everforest_transparent_background = 2
let g:everforest_sign_column_background = 'grey'
let g:everforest_ui_contrast = 'high'
let g:everforest_disable_terminal_colors = 1

" vim-airline
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
let g:airline#extentions#ale#enabled = 1
let g:airline#extentions#tabline#enabled = 1
let g:airline#extentions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline_section_x = ''
let g:airline_section_y = ''
"let g:airline_section_y = 'BN: %{bufnr("%")}'
"let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline_section_z = '%p%% %l/%L:%v'

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Turn on Rainbow parentheses
let g:rbpt_loadcmd_toggle = 1
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" transparent background
lua << EOF
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

EOF
