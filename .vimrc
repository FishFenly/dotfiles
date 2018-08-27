set nocompatible


filetype off

" Plugin directory
call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'

call plug#end()

filetype plugin on

""""""""""""
" SETTINGS "
""""""""""""

" set line numbers
"set number

" make backspace delete sensibly
set backspace=indent,eol,start

" autosave buffer
set autowrite

" configure invisible chars
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" ignore case if search is all lower
" 	however case-sensitive otherwise
set smartcase
set ignorecase

" backup and swap files
set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/

"" Netrw

let g:netrw_winsize = -28
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_browse_split = 3


"" LightLine

let g:lightline = { 'colorscheme': 'jellybeans', }

set laststatus=2
set noshowmode

"" Editorconfig
"let g:EditorConfig_core_mode = 'external_command'

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

"" Tabular

" Align on eqaul sign
vnoremap <silent> <Leader>cee	:Tabularize /=<CR>
" Align on # sign
vnoremap <silent> <Leader>cet	:Tabularize /#<CR>
" Align (no sign)
vnoremap <silent> <Leader>ce	:Tabularize /

""""""""""""
"   KEYS   "
""""""""""""

let mapleader = ','

" use jj to quickly escape to normal mode
inoremap jj <ESC>

" insert newline without entering insert mode
map <CR> o<Esc>k

" reloads vimrc
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Leader C prefix is for code related mappings (completion, tidy, documentation)
noremap <silent> <Leader>cc :TComment<CR>

" Leader F is for file related mappings (open, browse)
nnoremap <silent> <Leader>f  :CtrlP<CR>
nnoremap <silent> <Leader>fm :CtrlPMRU<CR>
nnoremap <silent> <Leader>fe :Lexplore<CR>

" Leader B is for buffer related mappings
nnoremap <silent> <Leader>b  :CtrlPBuffer<CR>
nnoremap <silent> <Leader>bb :bn<CR>
nnoremap <silent> <Leader>bd :bdelete<CR>
" unlock and lock the current buffer
nnoremap <silent> <Leader>bl :nomodifiable<CR>
nnoremap <silent> <Leader>bu :modifiable<CR>
