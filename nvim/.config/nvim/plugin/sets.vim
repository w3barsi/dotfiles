set hidden
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
set lazyredraw
set updatetime=50

highlight ColorColumn ctermbg=0 guibg=lightgrey
" 'default'             | 'palenight' 
" 'ocean'               | 'lighter'             
" 'darker'              | 'default-community' 
" 'palenight-community' | 'ocean-community'
" 'lighter-community'   | 'darker-community'
let g:material_theme_style = 'default-community'
let g:gruvbox_contrast_dark = 'hard' " normal | hard
let g:gruvbox_invert_selection='1'
let g:gruvbox_invert_tabline='2'
colorscheme gruvbox
set background=dark


let g:indentLine_char = "│"

let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2

let g:NERDSpaceDelims = 1
let g:NERDTreeShowHidden=1
let g:UltiSnipsExpandTrigger="<C-s>"
" let g:lightline = {
" \ 'colorscheme': 'wombat',
" \ }

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'js' : 1,
    \ 'javascript' : 1,
    \ 'javascriptreact' : 1,
    \ 'javascript.jsx' : 1,
    \}

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.ts,*.jsx,*.xml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'

let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'
