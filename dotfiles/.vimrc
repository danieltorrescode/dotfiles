set encoding=utf-8
set nu
set relativenumber
set ruler
set textwidth=79
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set foldmethod=manual
set splitbelow
set splitright
set background=dark
set t_Co=256
set hlsearch

let python_highlight_all=1
syntax on
" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode':'passive'}

" re-mapped keys
nmap <C-e> :Explore<CR>
nmap <C-x> :sp<CR>
nmap <C-y> :vsp<CR>
nmap <C-k> :tabnew<CR>

"SyntasticReset
"SyntasticCheck
"set list
"set list!
"noh

"set nocompatible              " required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"
"" add all your plugins here (note older versions of Vundle
"" used Bundle instead of Plugin)
"
"" ...
"
"Plugin 'vim-syntastic/syntastic'
"Plugin 'tomtom/tcomment_vim'
"Plugin 'posva/vim-vue'
"Plugin 'digitaltoad/vim-pug'
"
"" python
"Plugin 'davidhalter/jedi-vim'
"Plugin 'nvie/vim-flake8'
"
"" snippets
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
