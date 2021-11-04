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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'

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
" Plug 'BurntSushi/rnvim-treesitteripgrep'
call plug#end()


lua require('barsi')
let mapleader = " "


autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

