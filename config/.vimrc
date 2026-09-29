set encoding=utf-8
set nu
set relativenumber
set ruler
set textwidth=150
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