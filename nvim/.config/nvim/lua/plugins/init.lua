return {

	-- Dependencies
	"nvim-lua/plenary.nvim",

	-- Quality of Life
	"Darazaki/indent-o-matic",
	"RRethy/vim-illuminate",
	"mbbill/undotree",
	"tpope/vim-surround",
	"windwp/nvim-autopairs",
	"NvChad/nvim-colorizer.lua",
	"princejoogie/tailwind-highlight.nvim",

	-- Easy Commenting
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	},

	-- Handles session management like opening a project in VSCode
	-- {
	-- 	"rmagatti/auto-session",
	-- 	config = function()
	-- 		require("auto-session").setup({
	-- 			log_level = "error",
	-- 			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	-- 		})
	-- 	end,
	-- },

	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	"lukas-reineke/indent-blankline.nvim",

	{
		"mg979/vim-visual-multi",
		branch = "master",
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
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

			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "folke/neodev.nvim" },
			{ "j-hui/fidget.nvim" },
		},
	},

	-- LANGUAGE SPECIFIC
	"simrat39/rust-tools.nvim",

	-- Snippets stuff
	---- Ultisnips
	--use 'SirVer/ultisnips'
	--use 'honza/vim-snippets'
	--use 'quangnguyen30192/cmp-nvim-ultisnips'
	---- luasnips

	-- Formatting
	"jose-elias-alvarez/null-ls.nvim",
	"rhysd/vim-clang-format",

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-context" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "nvim-treesitter/playground" },
		},
	},

	"p00f/nvim-ts-rainbow",
	"windwp/nvim-ts-autotag",

	-- FILE NAVIGATION
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	-- use({ "kyazdani42/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } })

	"ThePrimeagen/harpoon",

	-- COLORS/THEME
	"raddari/last-color.nvim", -- Remembers last used colorscheme
	"gruvbox-community/gruvbox",
	"w3barsi/barstrata.nvim",
	"catppuccin/nvim",
	"Mofiqul/dracula.nvim",

	"nvim-lualine/lualine.nvim",
	"ryanoasis/vim-devicons",

	"lewis6991/gitsigns.nvim",

	"dstein64/vim-startuptime",
	"akinsho/toggleterm.nvim",
	"CRAG666/code_runner.nvim",

	-- Plugisn to keep an eyeo n
	-- https://github.com/hkupty/iron.nvim
	-- 'simrat39/symbols-outline.nvim'
}
