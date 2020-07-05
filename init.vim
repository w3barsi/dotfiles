syntax on


call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' " better :Ec
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree' " undo history 
Plug 'vim-airline/vim-airline' " status/tabline for vim
Plug 'vim-airline/vim-airline-themes' " status/tabline for vim
Plug 'preservim/nerdcommenter' " easy commenting
Plug 'jiangmiao/auto-pairs' " finished quotes and brackets

Plug 'jremmen/vim-ripgrep' " search tool
Plug 'lyuts/vim-rtags' " something for C
Plug 'tpope/vim-surround' " vim plugin to surround text with tag

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" THEMES
Plug 'gruvbox-community/gruvbox' " theme for vim
Plug 'tomasiser/vim-code-dark' 


call plug#end()

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

highlight ColorColumn ctermbg=0 guibg=lightgrey


colorscheme gruvbox 
set background=dark
let mapleader = " "

let g:airline_theme='gruvbox'
let g:NERDSpaceDelims = 1
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ycm_always_populate_location_list = 1
" let g:lightline = {
" \ 'colorscheme': 'wombat',
" \ }


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
" inoremap <C-j> <Esc>/<++><CR><Esc>cf>

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
" map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
map <F8> :w <CR> :!node %<CR>
