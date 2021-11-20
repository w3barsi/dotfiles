syntax on
filetype plugin on

call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/plenary.nvim'

    Plug 'preservim/nerdcommenter' " easy commenting
    Plug 'tpope/vim-surround' " vim plugin to surround text with tag

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'onsails/lspkind-nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'nvim-treesitter/playground'
    "
    " FILE NAVIGATION
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'kyazdani42/nvim-tree.lua'

    " VIM Plugins for Webdev
    Plug 'mattn/emmet-vim' " emmet for html
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'windwp/nvim-autopairs'
    Plug 'Yggdroot/indentLine'
    Plug 'alvan/vim-closetag' " Auto-close HTML Tags

    " THEMES
    Plug 'gruvbox-community/gruvbox' " theme for vim
    Plug 'tomasiser/vim-code-dark' 
    Plug 'marko-cerovac/material.nvim'
    Plug 'NTBBloodbath/doom-one.nvim'
    Plug 'dracula/vim'
    Plug 'olimorris/onedarkpro.nvim'
    Plug 'shaunsingh/nord.nvim'
    Plug 'ishan9299/nvim-solarized-lua'
    Plug 'kdheepak/monochrome.nvim'
    Plug 'folke/tokyonight.nvim'


    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lualine/lualine.nvim'

    Plug 'dstein64/vim-startuptime'
    Plug 'lewis6991/impatient.nvim'
    
    Plug 'akinsho/toggleterm.nvim'   
call plug#end()

lua require('impatient')
set termguicolors

lua require('barsi')
let mapleader = " "

autocmd FileType javascript,lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
