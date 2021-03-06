
colorscheme midnightsun
syntax on
set title
set wildmenu
set showtabline=2
set backspace=indent,eol,start " allow delete on pre-existing chars
set directory^=$HOME/.vim/tmp// " store swp files in .vim/tmp instead of current dir
let g:jsx_ext_required = 0 " Use JSX for js files

" ------ fuzzy search -------""
set nocompatible              " limit search to current project
set path+=**                  " allow recursive search with :find
filetype off                  " required


" ------ netrw -------
autocmd FileType netrw setl bufhidden=delete "allow :q in netrw after copying/deleting etc
let g:netrw_winsize = 15

" ---

" ------ search behaviour ------
set is
set nohlsearch
let g:ackprg = 'ag --nogroup --nocolor --column'

" ------ line numbers ------
set number
set relativenumber

" ------ tab btn behaviour ------
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent

" ------ word wrapping ------
set wrap
set breakindent
set linebreak


" add fzf to runtime path
set rtp+=/usr/local/opt/fzf
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/vim-textobj-user
call vundle#begin()


" ------------ VUNDLE ----------------

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Github plugins
Plugin 'tpope/vim-fugitive'

"lsp-support -- TODO: not working
Plugin 'neovim/nvim-lsp'
function! CurrentLineInfo()
lua << EOF
require'nvim_lsp'.tsserver.setup{}
EOF
endfunction


"Autocompletion plugins
"Plugin 'quramy/tsuquyomi'
"autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
"let g:tsuquyomi_disable_quickfix = 1
"let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

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
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Navigation plugins
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'

"Shortcut plugins
Plugin 'tpope/vim-repeat'

"Language-specific plugins
Plugin 'tpope/vim-rails'
Plugin 'leafgarland/typescript-vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'dense-analysis/ale'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['ruby', 'rubocop'],
\   'typescript': ['tslint', 'tsserver'],
\}
let g:ale_fixers = {
\   'javascript': [
\       'prettier'
\   ],
\}
let g:ale_linters_explicit = 1 " Only run linters named in ale_linters settings.
let g:ale_set_highlights = 0
let g:ale_sign_error = '✖︎'
let g:ale_sign_warning = '◦'
let g:ale_set_quickfix = 1
let g:ale_fix_on_save=1

"Airline Theme plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'

"Plugin 'prettier/vim-prettier'
"Plugin 'kien/ctrlp.vim'
"let g:ctrlp_max_files=0
"let g:ctrlp_user_command =  
  "\ ['.git', 'cd %s && git ls-files -co --exclude-standard']
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"
Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdcommenter'
"Plugin 'leafgarland/typescript-vim'
set rtp+=/usr/local/opt/fzf
"Plugin 'tpope/vim-commentary'

call vundle#end()
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
"---------------------------------------------------------"

"Keymaps
nnoremap <silent> <C-p> :FZF<CR>
:command LS Buffers
nnoremap <C-k><C-i> :ALEHover<CR>
nnoremap <C-k><C-r> :ALEFindReferences<CR>
nnoremap <C-k><C-d> :ALEGoToDefinition<CR>


"HTML Tab autocomplete (</     ctrl+x, ctrl+o)
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

