syntax on
filetype plugin on

call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " better :Ec
    Plug 'mbbill/undotree' " undo history 
    Plug 'preservim/nerdcommenter' " easy commenting
    Plug 'tpope/vim-surround' " vim plugin to surround text with tag


    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    " Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'onsails/lspkind-nvim'

    " TELESCOPE
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    " VIM Plugins for Webdev
    Plug 'mattn/emmet-vim' " emmet for html
    Plug 'ap/vim-css-color'
    Plug 'mlaursen/vim-react-snippets'
    Plug 'SirVer/ultisnips'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'windwp/nvim-autopairs'
    Plug 'Yggdroot/indentLine'

    " THEMES
    " Plug 'vim-airline/vim-airline' " status/tabline for vim
    " Plug 'vim-airline/vim-airline-themes' " status/tabline for vim
    Plug 'alvan/vim-closetag'
    Plug 'gruvbox-community/gruvbox' " theme for vim
    Plug 'tomasiser/vim-code-dark' 
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lualine/lualine.nvim'

    Plug 'dstein64/vim-startuptime'
    Plug 'lewis6991/impatient.nvim'
    
    Plug 'akinsho/toggleterm.nvim'   
    Plug 'akinsho/bufferline.nvim'

    " Outdated but saved for reference
    " Plug 'tpope/vim-surround' " vim plugin to surround text with tag
    " Plugins to install for CoC
    " :CocInstall coc-prettier coc-emmet coc-tsserver coc-sh coc-python coc-markdownlint coc-json coc-html coc-css coc-cland
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

lua require('impatient')

lua require('barsi')
let mapleader = " "

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
