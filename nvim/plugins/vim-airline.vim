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
