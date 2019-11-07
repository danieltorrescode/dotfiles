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

