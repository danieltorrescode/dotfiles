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

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

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
Plugin 'airblade/vim-gitgutter'
Plugin 'posva/vim-vue'
Plugin 'digitaltoad/vim-pug'

" react
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'

" linter and prettier
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'dense-analysis/ale'

" snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" NerdTree
Plugin 'preservim/nerdtree'

" vim-devicons
Plugin 'ryanoasis/vim-devicons'

" status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"#################################################################
"#################################################################

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
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"SyntasticReset
"SyntasticCheck

" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_linter_aliases = {
\  'vue': ['vue', 'javascript'],
\  'jsx': ['css', 'javascript']
\}
let g:ale_linters = {
\  'vue': ['eslint', 'vls'],
\  'jsx': ['stylelint', 'eslint']
\}
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
" Fix files automatically on save
let g:ale_fix_on_save = 1

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

let g:airline_theme='behelit'
let g:airline#extensions#tabline#enabled = 1
