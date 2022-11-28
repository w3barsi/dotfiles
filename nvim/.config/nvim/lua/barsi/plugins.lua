local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use) -- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")
	use({
		"theHamsta/nvim_rocks",
		run = "pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
	})


	-- Dependencies
	use("nvim-lua/plenary.nvim")

	use("Darazaki/indent-o-matic")
	use("RRethy/vim-illuminate")
	use("mbbill/undotree")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("NvChad/nvim-colorizer.lua")
	use("princejoogie/tailwind-highlight.nvim")
	use("folke/which-key.nvim")

	-- Easy Commenting
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Handles session management like opening a project in VSCode
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"mg979/vim-visual-multi",
		branch = "master",
	})
	use("anuvyklack/hydra.nvim")

	-- LSP
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use("neovim/nvim-lspconfig")
	use("ray-x/lsp_signature.nvim")

	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("onsails/lspkind-nvim")
	use("glepnir/lspsaga.nvim")

	use({
		"samodostal/copilot-client.lua",
		requires = {
			"zbirenbaum/copilot.lua", -- requires copilot.lua and plenary.nvim
			"nvim-lua/plenary.nvim",
		},
	})

	-- LANGUAGE SPECIFIC
	use("simrat39/rust-tools.nvim")

	-- Snippets stuff
	---- Ultisnips
	--use 'SirVer/ultisnips'
	--use 'honza/vim-snippets'
	--use 'quangnguyen30192/cmp-nvim-ultisnips'
	---- luasnips
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Formatting
	use("jose-elias-alvarez/null-ls.nvim")
	use("rhysd/vim-clang-format")

	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")

	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")

	-- FILE NAVIGATION
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("ThePrimeagen/harpoon")

	use("raddari/last-color.nvim") -- Remembers last used colorscheme
	-- COLORS/THEME
	use("gruvbox-community/gruvbox")
	use("martinsione/darkplus.nvim")
	use("shaunsingh/nord.nvim")
	use("w3barsi/poimandress.nvim")
	use("olivercederborg/poimandres.nvim")
	use("sainnhe/gruvbox-material")
	--use 'laureanray/poimandres.nvim'
	use("projekt0n/github-nvim-theme")
	--use 'ldelossa/vimdark'
	use("olimorris/onedarkpro.nvim")
	use("kvrohit/substrata.nvim")
	use("w3barsi/barstrata.nvim")
	use("NTBBloodbath/doom-one.nvim")
	use("rose-pine/neovim")
	use("catppuccin/nvim")
	use("marko-cerovac/material.nvim")
	use("sam4llis/nvim-tundra")
	use("folke/tokyonight.nvim")
	use("Mofiqul/dracula.nvim")
	use("Yazeed1s/oh-lucy.nvim")
	use({ "shaunsingh/oxocarbon.nvim", run = "./install.sh" })

	use("xiyaowong/nvim-transparent")
	use("nvim-lualine/lualine.nvim")
	use("ryanoasis/vim-devicons")
	use("kyazdani42/nvim-web-devicons")

	use("kdheepak/lazygit.nvim")
	use("lewis6991/gitsigns.nvim")

	use("dstein64/vim-startuptime")
	use("akinsho/toggleterm.nvim")
	use("CRAG666/code_runner.nvim")
	use("andweeb/presence.nvim")

	-- Plugisn to keep an eyeo n
	-- https://github.com/hkupty/iron.nvim
	-- 'simrat39/symbols-outline.nvim'
	if packer_bootstrap then
		require("packer").sync()
	end
end)

if packer_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})
