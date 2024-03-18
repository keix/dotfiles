syntax on

set expandtab
set shiftwidth=4
set tabstop=4
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set lisp
set nocindent
set autoindent
set number
set re=0
filetype indent on 
"set notermguicolors


"colorscheme ron
colorscheme molokai
"colorscheme atom-dark-256

set t_Co=256

call plug#begin()

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lambdalisue/fern.vim'

call plug#end()

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme = 'wombat'

" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
nmap <C-h> <Plug>AirlineSelectPrevTab
nmap <C-l> <Plug>AirlineSelectNextTab

imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

