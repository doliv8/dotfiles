source $VIMRUNTIME/defaults.vim

" indentation basics
set tabstop=4 shiftwidth=4 softtabstop=4

" Set tabstop to 2 spaces for HTML, CSS, JavaScript and PHP
autocmd FileType html,css,javascript,php set tabstop=2 shiftwidth=2 expandtab

" make sage files into python filetype
au BufreadPost *.sage set filetype=python

" disable added \n at eof
set noeol nofixeol

augroup python_files
    autocmd!
	" 1 tab indent
	" autocmd FileType python setlocal noexpandtab
	" autocmd FileType python set tabstop=4
	" autocmd FileType python set shiftwidth=4
	" 4 spaces indent
    autocmd FileType python set softtabstop=4
    autocmd FileType python set tabstop=4
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set expandtab
augroup END


" line counter
set nu
set encoding=utf-8


" VUNDLE
set nocompatible			" required
filetype off				" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" PLUGINS AREA
Plugin 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe'
"Plugin 'vim-syntastic/syntastic'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'davidhalter/jedi-vim'
" conditional loading of wayland clipboard
if exists('$WAYLAND_DISPLAY')
	Plugin 'jasonccox/vim-wayland-clipboard'
endif
Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on	" required


" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" to comment
map <C-_> gcc

" IJVM file support
" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
au BufRead,BufNewFile *.jas set filetype=ijvm

autocmd FileType ijvm call SetupIJVM()
function SetupIJVM()
	" setup vim-commentary comment type
	setlocal commentstring=//%s

	" setup some highlighting
	syntax match ijvmComment "//.*$"
	syntax keyword ijvmKeyword NOP OUT POP DUP SWAP BIPUSH ILOAD ISTORE IADD ISUB IMUL IAND IOR IN IFEQ IFLT IF_ICMPEQ IINC GOTO INVOKEVIRTUAL IRETURN HALT LDC_W WIDE
	syntax match ijvmNumber "\<\d\+\>"
	syntax match ijvmHexNumber "\<0[xX][0-9a-fA-F]\+\>"
	syntax match ijvmLabel "^\s*\w\+:"

	highlight link ijvmComment Comment
	highlight link ijvmKeyword Keyword
	highlight link ijvmNumber Number
	highlight link ijvmHexNumber Number
	highlight ijvmLabel ctermfg=Blue guifg=#FFFF00

	syntax match ijvmMethod /^\.method\s\+\w\+(\([^)]*\))/
	syntax match ijvmVar /^\s*\(\.var\|\.end-var\)$/
	syntax match ijvmMainConstantEndMethod /^\s*\(\.end-method\|\.main\|\.end-main\|\.constant\|\.end-constant\)$/

	highlight ijvmMethod ctermfg=DarkYellow guifg=#FFFF00
	highlight ijvmMainConstantEndMethod ctermfg=DarkYellow guifg=#FFFF00
	highlight ijvmVar ctermfg=Brown guifg=#FFFF00

	" syntax keyword MyLangLabelRef start loop end
	" highlight MyLangLabelRef ctermfg=Green guifg=#00FF00

endfunction


" 8088 file support
" Set the vim-commentary comment type commentstring based on the
" file's extension, overriding any " 'commentstring' that has already been set
	" setup vim-commentary comment type
au BufRead,BufNewFile *.s setlocal commentstring=!%s

" setup kiity terminal
set term=kitty
map <C-/> gcc

" allow for long strings parsing
set synmaxcol=10000
" set soft line wraps
set linebreak
set breakindent
set showbreak=...

