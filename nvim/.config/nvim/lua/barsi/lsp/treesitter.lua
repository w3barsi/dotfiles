require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"css",
		"tsx",
		"typescript",
		"javascript",
		"astro",
		"vue",
		"c",
		"bash",
		"dockerfile",
		"json",
		"lua",
		"php",
		"prisma",
		"rust",
		"toml",
		"vim",
		"yaml",
		"help",
	},
	indent = {
		enable = true,
		disable = { "python" },
	},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	rainbow = {
		enable = false,
		extended_mode = false,
		--colors = {
		--'#FFD700',
		--'#179FFF',
		--'#DA70D6',
		--'#FFD700',
		--'#179FFF',
		--'#DA70D6',
		--}
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	autotag = { enable = true },
	textobjects = {
		enable = true,
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})

require("treesitter-context").setup({
	enable = true,
	patterns = {
		default = {
			"class",
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
			"case",
		},
		json = {
			"pair",
		},
	},
})

require("nvim-treesitter.configs").setup({})
