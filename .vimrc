set nocompatible              " be iMproved
filetype off                  " required!

execute pathogen#infect()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/AnsiEsc.vim.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'einars/js-beautify'
Bundle 'maksimr/vim-jsbeautify'

" syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_error_symbol = '!'
let g:syntastic_ignore_files = ['\.min\.js$', '\.min\.css$']
let g:syntastic_loc_list_height = 5
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '!'
let g:syntastic_style_warning_symbol = '!'

let g:syntastic_html_checkers = []
let g:syntastic_java_checkers = []
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_sh_checkers = ['shellcheck']

let g:ctrlp_open_multiple_files = 'r'
set foldmethod=indent
set foldlevel=3
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
syntax on
set backspace=indent,eol,start

set hidden
set cursorline
set hlsearch

" show line no on startup
set number
filetype plugin indent on     " required!

set laststatus=2
colorscheme termschool
let g:airline#extensions#tabline#enabled = 1
let &colorcolumn=join(range(81,81),",")
set list
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
map <c-f> :call JsBeautify()<cr>
" Make <Esc> clear search highlights
let mapleader = ' '
let @s='0wyt.k*$%ofunction pA(bag, next) {var who = bag.who + ''|'' + pA.name;logger.verbose(''Inside'', who);return next();}'
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
noremap <leader><BS> :%s/\s\+$//c<CR>
noremap <leader>1 :set foldlevel=1<CR>
noremap <leader>2 :set foldlevel=2<CR>
noremap <leader>3 :set foldlevel=3<CR>
noremap <leader>4 :set foldlevel=4<CR>
noremap <leader>5 :set foldlevel=5<CR>
noremap <leader>6 :set foldlevel=6<CR>
noremap <leader>q :bd<CR>

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}

" Use the nearest .git directory as the cwd. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nnoremap <leader>bf :CtrlPCurFile<cr>
nnoremap <leader>bd :CtrlPCurWD<cr>
nnoremap <leader>ca :lcd ~/Shippable/api<cr>
nnoremap <leader>cw :lcd ~/Shippable/www<cr>
let g:ctrlp_working_path_mode = 0
