set modeline
set t_Co=256

syntax on
set background=dark
"set background=light

"color blue
"color darkblue
"color default
"color delek
"color desert
color desert256m
"color elflord
"color evening
"color koehler
"color morning
"color murphy
"color pablo
"color peachpuff
"color ron
"color shine
"color slate
"color tote
"color zellner

set tabstop=2
set shiftwidth=2

" use spaces instead of tabs
set expandtab
" display tabs as tabs instead of dot-space
"set nolist

" Allow arbitrary backspacing
set backspace=indent,eol,start

" Overwrite instead of rename files
set backupcopy=yes

" Highlight matching search terms
set hlsearch

filetype indent plugin on

" Show relative line numbers and absolute line number for current line
set number
set relativenumber

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/indentpython.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'elmcast/elm-vim'
Plug 'rodjek/vim-puppet'
Plug 'google/vim-jsonnet'
Plug 'jjo/vim-cue'
" Difficult to use...
Plug 'terryma/vim-multiple-cursors'
" Allows commenting with `gc`/`gcc`
Plug 'tpope/vim-commentary'
" Allows opening file browser with `-` key
Plug 'tpope/vim-vinegar'
" Manages ctags (for code-aware navigation)
Plug 'ludovicchabant/vim-gutentags'
" Handles changing between single-line and multi-line list/argument formats
Plug 'FooSoft/vim-argwrap'
" Jinja2 highlighting
Plug 'Glench/Vim-Jinja2-Syntax'
" Markdown
Plug 'plasticboy/vim-markdown'
" Indentation guides
Plug 'nathanaelkane/vim-indent-guides'
" Quarto syntax
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'quarto-dev/quarto-vim'

call plug#end()

" argwrap config
nnoremap <silent> <leader>a :ArgWrap<CR>
let g:argwrap_tail_comma = 1


" Bash-like tab completion
set wildmode=longest,list

" jsonnet config
let g:jsonnet_fmt_options="-n 4"

" vim-indent-guides config:
" Enable indentation guides by default
let g:indent_guides_enable_on_vim_startup = 1
" Custom colors
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=236
