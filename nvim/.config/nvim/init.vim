syntax on
filetype plugin on

call plug#begin('~/.vim/plugged')
    " Dependencies
    Plug 'nvim-lua/plenary.nvim'

    Plug 'preservim/nerdcommenter'                                  " easy commenting
    Plug 'tpope/vim-surround'                                       " vim plugin to surround text with tag
    Plug 'windwp/nvim-autopairs'    
    Plug 'norcalli/nvim-colorizer.lua'                              " Adds colors to color codes
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    " Plug 'Yggdroot/indentLine'
    Plug 'lukas-reineke/indent-blankline.nvim'


    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'

    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'onsails/lspkind-nvim'
    Plug 'ray-x/lsp_signature.nvim'

    Plug 'jose-elias-alvarez/null-ls.nvim'
    
    Plug 'windwp/nvim-ts-autotag'                                       " Auto-close HTML Tags

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " We recommend updating the parsers on update
    Plug 'p00f/nvim-ts-rainbow'
    "Plug 'nvim-treesitter/playground'

    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
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
    Plug 'Mofiqul/vscode.nvim'
    Plug 'marko-cerovac/material.nvim'
    Plug 'NTBBloodbath/doom-one.nvim'
    Plug 'dracula/vim'
    Plug 'olimorris/onedarkpro.nvim'
    Plug 'shaunsingh/nord.nvim'
    Plug 'ishan9299/nvim-solarized-lua'
    Plug 'kdheepak/monochrome.nvim'
    Plug 'folke/tokyonight.nvim'

    Plug 'xiyaowong/nvim-transparent'

    Plug 'kdheepak/lazygit.nvim'   
    Plug 'lewis6991/gitsigns.nvim'

    Plug 'xiyaowong/nvim-transparent'
    Plug 'dstein64/vim-startuptime'
    Plug 'lewis6991/impatient.nvim'
    Plug 'akinsho/toggleterm.nvim'   
    Plug 'CRAG666/code_runner.nvim'

    " Old plugins
        " Plug 'alvan/vim-closetag'                                       " Auto-close HTML Tags
        " Plug 'leafOfTree/vim-matchtag'

call plug#end()

lua require('impatient')
lua require('barsi.options')
set termguicolors

let mapleader=" "
lua require('barsi')

autocmd FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=5
autocmd FileType c setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType jsonc setlocal shiftwidth=2 tabstop=2 expandtab

autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
