"---------------------------VUNDLE----------------------"
set nocompatible              " be iMproved, required
filetype off                  " required

" store swp files in .vim/tmp instead of current dir
set directory^=$HOME/.vim/tmp//

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/vim-textobj-user
call vundle#begin()

let g:netrw_winsize = 15

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"


" Use JSX for js files
let g:jsx_ext_required = 0

" Enable deoplete startup
"let g:deoplete#enable_at_startup = 1
"

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

"Github plugins
Plugin 'tpope/vim-fugitive'

"Autocompletion plugins
Plugin 'quramy/tsuquyomi'
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

  "autocomplete surroundings...
Plugin 'raimondi/delimitmate'
  "autocomplete surroundings
Plugin 'jiangmiao/auto-pairs'
  "manage surroundings
Plugin 'tpope/vim-surround'

"Error checking plugins
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
  "for js
Plugin 'w0rp/ale'

"Navigation plugins
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
  "nerdtree
Plugin 'scrooloose/nerdtree'
map <C-h> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFind<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

  "quick fuzzy search
"Plugin 'git://git.wincent.com/command-t.git'

"Shortcut plugins
Plugin 'tpope/vim-repeat'

"Language-specific plugins
Plugin 'tpope/vim-rails'
Plugin 'leafgarland/typescript-vim'
Plugin 'elixir-lang/vim-elixir'

"Theme plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'

"Plugin 'prettier/vim-prettier'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_files=0
let g:ctrlp_user_command =  
  \ ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plugin 'scrooloose/nerdcommenter'
"Plugin 'leafgarland/typescript-vim'
set rtp+=/usr/local/opt/fzf
"Plugin 'tpope/vim-commentary'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

call vundle#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"---------------------------------------------------------"

"KEY MAPPINGS
"Buffers
"
" :ls & :b shortcut
map <Leader>` :ls<CR>:b<Space>

" next & previous buffers
nnoremap <Leader>2 :bnext<CR>
nnoremap <Leader>1 :bprevious<CR>

"open buffer list for range deletion
:nnoremap <leader>lsd :ls<cr>:bd<home>

" switch windows:
map <Leader>d <C-W>W
map <Leader>f <C-W>w

" switch tabs:
map <Leader>3 gT
map <Leader>4 gt
map <Leader>5 <C-^>

" delete buffer from list:
map <Leader>ld :ls<CR>:bd
" close buffer:
map <Leader>z :BD <cr>

filetype on
colorscheme midnightsun
syntax on

set title
set showtabline=2

" search behaviour
set is
set nohlsearch
let g:ackprg = 'ag --nogroup --nocolor --column'

" Set numbers
set number
set relativenumber

" Tab behaviour
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent

"word wrap
set wrap
set breakindent
set linebreak

"Wild Menu
set wildmenu

"HTML Tab autocomplete (</     ctrl+x, ctrl+o)
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"set tab title to CWD
"set t_ts=]1
"set t_fs=
let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

