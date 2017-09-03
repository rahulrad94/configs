set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'git://github.com/jlanzarotta/bufexplorer.git'
Plugin 'git://github.com/Raimondi/delimitMate.git'
Plugin 'git://github.com/easymotion/vim-easymotion.git'
Plugin 'git://github.com/tpope/vim-fugitive.git'
Plugin 'git://github.com/sjl/gundo.vim.git'
Plugin 'git://github.com/henrik/vim-indexed-search.git'
Plugin 'git://github.com/davidhalter/jedi-vim.git'
Plugin 'git://github.com/Shougo/neocomplete.vim.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'git://github.com/scrooloose/syntastic.git'
Plugin 'git://github.com/vim-airline/vim-airline.git'
Plugin 'git://github.com/osyo-manga/vim-over.git'
Plugin 'git://github.com/mhinz/vim-startify.git'

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/Pydiction'

call vundle#end()            " required
filetype plugin indent on    " required

set clipboard=unnamed
set noswapfile

"coloring
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"toggle dark and light colors using F5 key
call togglebg#map("<F5>")

set guifont=PragmataPro\ 12

"set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000
set spelllang =en,de

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom
set hlsearch
set ignorecase
set showmatch
set number      "show line numbers
set incsearch   "find the next match as we type the search
set lz "lazy screen redraw an running scripts

"display tabs and trailing spaces
"set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

"default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab

"for python
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/
set encoding=utf-8

"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" for code folding
let g:SimpylFold_docstring_preview=1

" for code completion 
let g:ycm_autoclose_preview_window_after_completion=1
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1

"turn on syntax highlighting
syntax on

autocmd FileType python set autoindent

"enable folding
set foldmethod=indent
set foldlevel=99
"enable folding with space 
nnoremap <space> za 


"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"tell the term has 256 colors/uncomment if u want use csapprox
set t_Co=256
