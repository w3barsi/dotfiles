syntax on
filetype plugin on

call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/plenary.nvim'

    Plug 'preservim/nerdcommenter'                                  " easy commenting
    Plug 'tpope/vim-surround'                                       " vim plugin to surround text with tag
    Plug 'windwp/nvim-autopairs'                                    " Uses treesitter to add pairs like ",',{,[,(
    Plug 'norcalli/nvim-colorizer.lua'                              " Adds colors to color codes
    Plug 'Yggdroot/indentLine'
    Plug 'alvan/vim-closetag'                                       " Auto-close HTML Tags

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'onsails/lspkind-nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " We recommend updating the parsers on update
    Plug 'nvim-treesitter/playground'

    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'             " Snippets engine
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'                  

    " FILE NAVIGATION
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'kyazdani42/nvim-tree.lua'

    " THEMES
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    
    " COLORS
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



    Plug 'dstein64/vim-startuptime'
    Plug 'lewis6991/impatient.nvim'
    Plug 'akinsho/toggleterm.nvim'   

call plug#end()

lua require('impatient')
set termguicolors

lua require('barsi')
let mapleader = " "

autocmd FileType javascript,lua setlocal shiftwidth=4 tabstop=4 softtabstop=4

