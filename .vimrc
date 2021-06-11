" mappings

let mapleader=","
nnoremap <leader>l :ls<CR>
nnoremap <leader>b :ls<CR>:b
nnoremap <leader>w <C-w>
nnoremap <leader>n :set invnumber<CR>

" plugins

call plug#begin('vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()

" theme
let g:airline_theme='deus'

" all tabs must die
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" who enabled it in the first place?
set paste

" highlight search term
set hlsearch

" line numbers on by default
set nu

" cya mouse
set mouse =


