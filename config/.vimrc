set encoding=utf-8
set nu
set relativenumber
set ruler
set textwidth=79
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set foldmethod=manual
set splitbelow
set splitright
set background=dark
set t_Co=256
set hlsearch

" re-mapped keys
nmap <C-n> :Explore<CR>
nmap <C-x> :sp<CR>
nmap <C-l> :vsp<CR>
nmap <C-k> :tabnew<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

"nnoremap <Up> :resize +2<CR>
"nnoremap <Down> :resize -2<CR>
"nnoremap <Left> :vertical resize +2<CR>
"nnoremap <Right> :vertical resize -2<CR>

"set list
"set list!
"noh

"#################################################################
"#################################################################

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

Plugin 'vim-syntastic/syntastic'
Plugin 'tomtom/tcomment_vim'
" status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"#################################################################
"#################################################################

syntax on
" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:airline_theme='behelit'
let g:airline#extensions#tabline#enabled = 1
