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

Plug 'leafgarland/typescript-vim'
Plug 'elmcast/elm-vim'
Plug 'rodjek/vim-puppet'
" Difficult to use...
Plug 'terryma/vim-multiple-cursors'
" Allows commenting with `gc`/`gcc`
Plug 'tpope/vim-commentary'
" Allows opening file browser with `-` key
Plug 'tpope/vim-vinegar'
" Manages ctags (for code-aware navigation)
Plug 'ludovicchabant/vim-gutentags'
Plug 'FooSoft/vim-argwrap'

call plug#end()

" argwrap config
nnoremap <silent> <leader>a :ArgWrap<CR>
let g:argwrap_tail_comma = 1
