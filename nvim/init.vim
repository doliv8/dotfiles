" indentation basics
set tabstop=4 shiftwidth=4 softtabstop=4

augroup python_files
    autocmd!
    autocmd FileType python setlocal noexpandtab
    autocmd FileType python set tabstop=4
    autocmd FileType python set shiftwidth=4
augroup END


" line counter
set relativenumber
set encoding=utf-8


" VUNDLE
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" PLUGINS AREA
"Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'lifepillar/vim-mucomplete'
"Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-commentary'
Plugin 'jasonccox/vim-wayland-clipboard'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

"make code look pretty
let python_highlight_all=1
syntax on

"enable system keyboard
if has('mouse')
   set mouse=a
endif

set completeopt+=menuone

"disable jedi-vim autocomplete on dot
let g:jedi#popup_on_dot = 0


" enable youcompleteme
"packadd! youcompleteme

" compile and run keybind
au BufEnter *.cpp set makeprg=g++\ -g\ %\ -o\ %<\ -Wall\ &&\ ./%<
au BufEnter *.c set makeprg=gcc\ -g\ %\ -o\ %< 
au BufEnter *.py set makeprg=python\ % 
map! <C-K> <C-o>:call CompileAndRun()<CR>
map <C-K> :call CompileAndRun()<CR>
func! CompileAndRun()
    exec "w" 
    make
endfunc

map <C-_> gcc
map <C-/> gcc

" idk good selection V[move]gq
"set cindent
"set formatoptions=tcqr

