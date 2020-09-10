syntax on 

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' " better :Ec
Plug 'jremmen/vim-ripgrep' " search tool
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree' " undo history 
Plug 'vim-airline/vim-airline' " status/tabline for vim
Plug 'vim-airline/vim-airline-themes' " status/tabline for vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdcommenter' " easy commenting
Plug 'jiangmiao/auto-pairs' " finished quotes and brackets
Plug 'lyuts/vim-rtags' " something for C
Plug 'tpope/vim-surround' " vim plugin to surround text with tag


Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plugins to install for CoC
" :CocInstall coc-prettier coc-emmet coc-tsserver coc-sh coc-python coc-markdownlint coc-json coc-html coc-css coc-cland


Plug 'sheerun/vim-polyglot'

" Plug 'Valloric/YouCompleteMe' 
" word completer -- has to be manually installed
" to install navigate to plugin folder
" do ./install.py
" then do './install.py --clangd-completer'

" VIM Plugins for Webdev
Plug 'digitaltoad/vim-pug' " html5 syntax plugin 
Plug 'mattn/emmet-vim' " emmet for html
Plug 'turbio/bracey.vim' " vim plugin for live server 
Plug 'alvan/vim-closetag' " auto close <tags> for html
Plug 'ap/vim-css-color'

Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
" Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

" THEMES
Plug 'gruvbox-community/gruvbox' " theme for vim
Plug 'tomasiser/vim-code-dark' 



call plug#end()

" set shell=

set mouse=a
set nohlsearch
set nu rnu " Relative Line Number
set encoding=UTF-8
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
set laststatus=2
set signcolumn=yes:1

highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader = " "

" let g:gruvbox_contrast_dark = 'hard'
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

let g:UltiSnipsExpandTrigger="<tab>"

let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'



" VIM SETTINGS
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :NERDTreeToggle<CR> 
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>= :vertical resize +5<CR>

" File Navigation
nnoremap <C-p> :Files<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bl :ls<CR>
nnoremap <Leader>ra :%s//g<Left><Left>
nnoremap <Leader>rw :%s//gc<Left><Left><Left>
nnoremap <C-i> gg=G
nnoremap <C-j> <Esc>/<++><CR><Esc>cf>



" YCM
" nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
" nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
" nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
" nnoremap <Leader>n :lnext<CR>
" nnoremap <Leader>b :lprevious<CR>

" COC
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <leader>b <Plug>(coc-diagnostic-prev)
nmap <leader>n <Plug>(coc-diagnostic-next)
nmap <leader>gb <Plug>(coc-diagnostic-prev-error)
nmap <leader>gn <Plug>(coc-diagnostic-next-error)


nnoremap <Leader>e :Emmet<SPACE>
nmap <leader>p :CocCommand prettier.formatFile<CR>

" COMPILE/RUN CODE
function! UseNode()
    map <buffer> <F8> :w <CR> :!node %<CR>
endfunction

function! UseGCC()
    map <buffer> <F8> :w <CR> :!gcc % -o %< && ./%<<CR>
endfunction

function! UsePy()
    map <buffer> <F8> :w <CR> :!python3 %<CR>
endfunction

function! UseJava()
    map <buffer> <F8> :w <CR> :!javac % && java %<<CR>
endfunction

autocmd FileType javascript,js,typescript,ts :call UseNode()
autocmd FileType cpp,cxx,h,hpp,c :call UseGCC()
autocmd FileType python :call UsePy()
autocmd FileType java :call UseJava()
