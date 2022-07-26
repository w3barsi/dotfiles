set encoding=UTF-8
set fillchars+=vert:\           " removes | vsplit separator
set fillchars+=eob:\            " removes ~ end of file
set hidden
set autoread
set nu rnu                      " Relative Line Number
set nohlsearch                  " no highlight search
set mouse=a                     " allows mouse control
set encoding=utf-8              " allows UTF-8 characters
set noerrorbells
set expandtab
set smartindent
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
set scrolloff=8
set laststatus=2
set signcolumn=yes:1            " enables column for errors
set clipboard+=unnamedplus       " uses system clipbaord for yank
set lazyredraw                  " removes flashing when using <silent> commands
set updatetime=50
set termguicolors
set cursorline
set splitright                  " vertical split opens to right
set splitbelow                  " horizontal split opens bottom
set completeopt=menu,menuone,noselect

set backspace=indent,eol,start


"set background=dark

colorscheme darkplus

let g:gruvbox_contrast_dark = 'normal' " soft | normal | hard
let g:gruvbox_invert_selection='0'
let g:gruvbox_invert_tabline='0'
let g:material_style = 'darker'
let g:tokyonight_style = 'night'

"highlight Normal guibg=black
highlight SignColumn guibg=bg
highlight NvimTreeNormal guibg=#1d2021
highlight VertSplit guibg=#1d2021

highlight GitSignsAdd guibg=NONE
highlight GitSignsAdd guifg=#b8bb26
highlight GitSignsChange guibg=NONE
highlight GitSignsChange guifg=#fe8019
highlight GitSignsDelete guibg=NONE
highlight GitSignsDelete guifg=#fb4934

