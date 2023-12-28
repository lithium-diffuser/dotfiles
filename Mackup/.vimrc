set nocompatible
filetype on

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif

if has('mouse')
  set mouse=a
endif

set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set visualbell
set backspace=indent,eol,start

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Copies the currently selected text to the system clipboard (OSX)
" To copy or paste with your system's clipboard in Vim with these you would use @c and @p respectively, after selecting text with visual mode (press v).
let @c = ':w !pbcopy'
let @p = ':r !pbpaste'
set pastetoggle=<leader>p

nnoremap <C-L> :nohl<CR><C-L>

" NerdTree config

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/NERDTree'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'ap/vim-css-color'
Plug 'sjl/vitality.vim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme nord