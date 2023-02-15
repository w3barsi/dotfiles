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

	-- Quality of Life
	use("Darazaki/indent-o-matic")
	use("RRethy/vim-illuminate")
	use("mbbill/undotree")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("NvChad/nvim-colorizer.lua")
	use("princejoogie/tailwind-highlight.nvim")

	-- Easy Commenting
	use({ "numToStr/Comment.nvim", requires = { "JoosepAlviste/nvim-ts-context-commentstring" } })

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
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "ray-x/lsp_signature.nvim" },

			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "onsails/lspkind-nvim" },
			{ "glepnir/lspsaga.nvim" },

			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
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

	-- Formatting
	use("jose-elias-alvarez/null-ls.nvim")
	use("rhysd/vim-clang-format")

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			{ "nvim-treesitter/nvim-treesitter-context" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "nvim-treesitter/playground" },
		},
	})

	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")

	-- FILE NAVIGATION
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	-- use({ "kyazdani42/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	use("ThePrimeagen/harpoon")

	-- COLORS/THEME
	use("raddari/last-color.nvim") -- Remembers last used colorscheme
	use("gruvbox-community/gruvbox")
	use("w3barsi/barstrata.nvim")
	use("catppuccin/nvim")
	use("Mofiqul/dracula.nvim")

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
