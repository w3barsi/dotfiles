set autoread
set nohlsearch
set mouse=a
set nu rnu " Relative Line Number
set encoding=utf-8
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
set scrolloff=8
set laststatus=2
set signcolumn=yes:1
set clipboard=unnamedplus
set updatetime=50
set completeopt=menu,menuone
set lazyredraw

highlight ColorColumn ctermbg=0 guibg=lightgrey
" 'default'             | 'palenight' 
" 'ocean'               | 'lighter'             
" 'darker'              | 'default-community' 
" 'palenight-community' | 'ocean-community'
" 'lighter-community'   | 'darker-community'
let g:material_theme_style = 'default-community'
let g:gruvbox_contrast_dark = 'normal' " normal | hard
let g:gruvbox_inver_selection='0'
colorscheme gruvbox
set background=dark



let g:airline_theme='gruvbox'
let g:NERDSpaceDelims = 1
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ycm_always_populate_location_list = 1
let g:UltiSnipsExpandTrigger="<C-s>"
" let g:lightline = {
" \ 'colorscheme': 'wombat',
" \ }

let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'
