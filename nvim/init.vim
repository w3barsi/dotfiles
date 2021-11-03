syntax on 
filetype plugin on

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree' " better :Ec
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree' " undo history 
Plug 'preservim/nerdcommenter' " easy commenting
Plug 'jiangmiao/auto-pairs' " finished quotes and brackets
Plug 'tpope/vim-surround' " vim plugin to surround text with tag

" Plugins to install for CoC
" :CocInstall coc-prettier coc-emmet coc-tsserver coc-sh coc-python coc-markdownlint coc-json coc-html coc-css coc-cland
Plug 'neoclide/coc.nvim', {'branch': 'release'}


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
Plug 'vim-airline/vim-airline' " status/tabline for vim
Plug 'vim-airline/vim-airline-themes' " status/tabline for vim
Plug 'gruvbox-community/gruvbox' " theme for vim
Plug 'tomasiser/vim-code-dark' 
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" TELESCOPE
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'BurntSushi/rnvim-treesitteripgrep'



call plug#end()



" set shell=



highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader = " "

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
nnoremap <C-p> :lua require('telescope.builtin').find_files()<cr>

" REPLACEALL & REPLACEWORD
nnoremap <Leader>ra :%s//g<Left><Left>
nnoremap <Leader>rw :%s//gc<Left><Left><Left>

nnoremap <Leader>sv :source $MYVIMRC<CR>

" COC
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <leader>b <Plug>(coc-diagnostic-prev)
nmap <leader>n <Plug>(coc-diagnostic-next)
nmap <leader>gb <Plug>(coc-diagnostic-prev-error)
nmap <leader>gn <Plug>(coc-diagnostic-next-error)

nnoremap <Leader>e :Emmet<SPACE>
nmap <leader>p :CocCommand prettier.formatFile<CR>

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
