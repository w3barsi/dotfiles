syntax on
filetype plugin on

call plug#begin('~/.vim/plugged')
    " Dependencies
    Plug 'nvim-lua/plenary.nvim'
    Plug 'tpope/vim-sleuth'

    Plug 'preservim/nerdcommenter'                                  " easy commenting
    Plug 'tpope/vim-surround'                                       " vim plugin to surround text with tag
    Plug 'windwp/nvim-autopairs'    
    Plug 'norcalli/nvim-colorizer.lua'                              " Adds colors to color codes
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'anuvyklack/hydra.nvim'


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
    Plug 'glepnir/lspsaga.nvim'
    "Plug 'github/copilot.vim'

    " Formatting
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'rhysd/vim-clang-format'
    

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " We recommend updating the parsers on update
    Plug 'nvim-treesitter/playground'

    Plug 'p00f/nvim-ts-rainbow'
    Plug 'windwp/nvim-ts-autotag'                                       " Auto-close HTML Tags

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
    Plug 'martinsione/darkplus.nvim'
    Plug 'shaunsingh/nord.nvim'
    Plug 'w3barsi/poimandress.nvim'
    Plug 'olivercederborg/poimandres.nvim'
    " Plug 'sainnhe/gruvbox-material'
    " Plug 'projekt0n/github-nvim-theme'

    Plug 'xiyaowong/nvim-transparent'

    Plug 'kdheepak/lazygit.nvim'   
    Plug 'lewis6991/gitsigns.nvim'

    Plug 'dstein64/vim-startuptime'
    Plug 'lewis6991/impatient.nvim'
    Plug 'akinsho/toggleterm.nvim'   
    Plug 'CRAG666/code_runner.nvim'
    Plug 'andweeb/presence.nvim'

    " Old plugins
        " Plug 'alvan/vim-closetag'                                       " Auto-close HTML Tags
        " Plug 'leafOfTree/vim-matchtag'init

call plug#end()

lua require('impatient')

lua require('barsi')


imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
