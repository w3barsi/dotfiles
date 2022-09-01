--local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
--local is_bootstrap = false

--if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  --is_bootstrap = true
  --vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  --vim.cmd [[packadd packer.nvim]]
--end


--require('barsi')
--print("TEST")


--return require('packer').startup(function(use)
  ---- Packer can manage itself
  --use 'wbthomason/packer.nvim'

  --use 'nvim-lua/plenary.nvim'
  --use 'tpope/vim-sleuth'

  ---- Easy Commenting
  --use 'preservim/nerdcommenter'
  ---- vim plugin to surround text with tag
  --use 'tpope/vim-surround'
  --use 'windwp/nvim-autopairs'
  ---- Adds colors to color codes
  --use 'norcalli/nvim-colorizer.lua'
  --use({
    --"iamcco/markdown-preview.nvim",
    --run = function() vim.fn["mkdp#util#install"]() end,
  --})
  --use 'lukas-reineke/indent-blankline.nvim'
  --use {
    --'mg979/vim-visual-multi',
    --branch = 'master'
  --}
  --use 'anuvyklack/hydra.nvim'
  ---- LSP
  --use 'neovim/nvim-lspconfig'
  --use 'williamboman/nvim-lsp-installer'

  --use 'hrsh7th/cmp-nvim-lua'
  --use 'hrsh7th/cmp-nvim-lsp'
  --use 'hrsh7th/cmp-buffer'
  --use 'hrsh7th/cmp-path'
  --use 'hrsh7th/nvim-cmp'
  --use 'hrsh7th/cmp-nvim-lsp-signature-help'
  --use 'onsails/lspkind-nvim'
  --use 'ray-x/lsp_signature.nvim'
  --use 'glepnir/lspsaga.nvim'
  ---- use 'github/copilot.vim'

  ---- Formatting
  --use 'jose-elias-alvarez/null-ls.nvim'
  --use 'rhysd/vim-clang-format'

  --use 'nvim-treesitter/nvim-treesitter'
  --use 'nvim-treesitter/playground'

  --use 'p00f/nvim-ts-rainbow'
  --use 'windwp/nvim-ts-autotag'

  --use 'SirVer/ultisnips'
  --use 'honza/vim-snippets'
  --use 'quangnguyen30192/cmp-nvim-ultisnips'

  ---- FILE NAVIGATION
  --use 'nvim-telescope/telescope.nvim'
  --use 'nvim-telescope/telescope-fzy-native.nvim'
  --use 'kyazdani42/nvim-tree.lua'


  ---- THEMES
  --use 'nvim-lualine/lualine.nvim'
  --use 'ryanoasis/vim-devicons'
  --use 'kyazdani42/nvim-web-devicons'

  ---- COLORS
  --use 'gruvbox-community/gruvbox'
  --use 'martinsione/darkplus.nvim'
  --use 'shaunsingh/nord.nvim'
  --use 'w3barsi/poimandress.nvim'
  --use 'olivercederborg/poimandres.nvim'
  ---- use 'sainnhe/gruvbox-material'
  ---- use 'projekt0n/github-nvim-theme'

  --use 'xiyaowong/nvim-transparent'

  --use 'kdheepak/lazygit.nvim'
  --use 'lewis6991/gitsigns.nvim'

  --use 'dstein64/vim-startuptime'
  --use 'lewis6991/impatient.nvim'
  --use 'akinsho/toggleterm.nvim'
  --use 'CRAG666/code_runner.nvim'
  --use 'andweeb/presence.nvim'

  ---- Old plugins
  ---- Plug 'alvan/vim-closetag'                                       " Auto-close HTML Tags
  ---- Plug 'leafOfTree/vim-matchtag'init
---end)

require('impatient')
-- User Settings
require('barsi.plugins')
require('barsi.options')
require('barsi.remap')
require('barsi.hydra')

-- LSP Settings
require('barsi.lsp.lsp')
require('barsi.lsp.cmp')
require('barsi.lsp.null-ls')
require('barsi.lsp.treesitter')

-- Plugin Settings
require('barsi.autocmd')
require('barsi.autotag')
require('barsi.code_runner')
require('barsi.git')
require('barsi.indentline')
require('barsi.lualine')
require('barsi.nvim-tree')
require('barsi.telescope')
require('barsi.terminal')
require('barsi.themes')
require('barsi.transparent')
