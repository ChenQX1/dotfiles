set background=dark

if (has("termguicolrs"))
    set termguicolors
endif

"let g:material_terminal_italics = 0
"let g:material_theme_style = "palenight"
"colorscheme material

colorscheme seoul256

" Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let g:airline#extentions#tabline#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:airline_theme='onedark'

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
