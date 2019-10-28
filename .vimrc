" ================
" Prescott's vimrc
" ================

" set runtimepath^=~/.vim/bundle/ctrlp.vim " ctrl-p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" load plugins from vundle, required
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'elzr/vim-json'
Plugin 'levelone/tequila-sunrise.vim'

" utilities

" colorschemes
colorscheme Iosvkem

" JavaScript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()
filetype plugin indent on

" Files, backups and undo
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set nocompatible        " not compatible with vi
set autoread            " detect when a file is changed

"make backspace behave in a sane manner
set backspace=indent,eol,start

let mapleader = ','

" Tab control
" Make a tab equal to x spaces
" let s:tabwidth=4
" exec 'set tabstop='     .s:tabwidth
" exec 'set shiftwidth='  .s:tabwidth
" exec 'set softtabstop=' .s:tabwidth
set noexpandtab         " Make sure that every file uses real tabs, not spaces
set smarttab            " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4           
set softtabstop=4       " edit as if the tabs are 4 characters wide
set shiftwidth=4        " number of spaces to use for indent and unindent
set shiftround          " Round indent to multiple of 'shiftwidth'
set smartindent         " Do smart indenting when starting a new line
set autoindent          " copy indent from current line, over to the new line

set clipboard=unnamed

" faster redrawing
set ttyfast

" code folding settings
set foldmethod=syntax   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocorrect basic typos:
iabbrev waht what
iabbrev tehn then
iabbrev taht that
iabbrev adn and
iabbrev ot to
iabbrev aling align
iabbrev accross across
iabbrev hte the

" Searching
set hlsearch            " Highlight search matches
set incsearch           " Enable incremental searching
set ignorecase          " Ignore case when searching
set smartcase           " Override 'ignorecase' if search pattern has upper characters
set nolazyredraw        " don't redraw while executing macros

set magic               " set magic on, for regex
set showmatch           " show matching braces
set mat=2               " how many tenths of a second to blink

" switch syntax highlighting on
syntax on

set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256              " Explicityly tell vim that the terminal supoprts 256 colors

set ruler               " Show the line and column number of the cursor position
set colorcolumn=80      " column width 80 char default
set number              " Turn on line numbering
set nowrap              " Turn off line wrapping

set list                " Show invisible characters
set listchars=tab:>\ ,eol:¬,trail:⋅,extends:>,precedes:<

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable arrow key cursor motion
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" normal-mode settings:
map <space> :
nnoremap <C-n> :nohl <return>
noremap cp yap<S-}>p

" change window size
noremap <C-up> <C-w>+
noremap <C-down> <C-w>-
noremap <C-left> <C-w><
noremap <C-right> <C-w>>

" switch between windows
no <C-j> <C-w>j|
no <C-k> <C-w>k|
no <C-l> <C-w>l|
no <C-h> <C-w>h|


" alternate for escape
inoremap jk <esc>

" this does a thing
noremap <leader>a =ip


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let NERDTreeQuitOnOpen=0 " show hidden files in NERDTree
let NERDTreeShowHidden=1 " show hidden files in NERDTree
" Toggle NERDTree
map <silent> <leader>k :NERDTreeToggle<CR> 
" Expand to the path of the file in the current buffer
map <silent> <leader>y :NERDTreeFind<CR>

" dont remember what this does
autocmd StdinReadPre * let s:std_in=1
" open NERDTree with empty vim file when typing 'vim' instead of 'vim .'
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" do not allow NERDTree to open a file in NERDTree buffer
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" Spell Check
noremap <silent> <leader>s :set spell!<cr>
" ]s  Next spelling mistake
" [s  Previous spelling mistake
" z=  Give suggestions (prepent 1, use first suggestions automatically)
" zg  Add mispelled to spellfile
" zug Remove word from spellfile

" AirlineTheme <Theme Name>
let g:airline_theme='dark' " airline theme

" set pymode python engine
let g:pymode_python = 'python3' " pymode settings

" emmet settings
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntax on
" syntax enable
" colorscheme distinguished

" filetype indent plugin on




" set bg=dark                 " tell vim using a dark background
" set updatetime=100
" set history=1000            " Save 1,000 items in history
" set showcmd                 " Display the incomplete commands in the bottom of your screen
" set wildmenu                " Display completion matches on your status line
" set scrolloff=5             " Show a few lines of context around the cursor
" let g:netrw_dirhistmax = 0  " turn off history
" let g:netrw_banner = 0


