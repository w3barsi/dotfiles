local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		borderchars = {
			{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		},
		mappings = {
			i = {
				-- ["<esc>"] = actions.close,
				["<S-Tab>"] = actions.move_selection_next,
				["<Tab>"] = actions.move_selection_previous,
			},
		},
		file_ignore_patterns = {
			".git",
			"node_modules",
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--hidden",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		layout_config = {
			horizontal = {
				sorting_strategy = "ascending",
				preview_width = 0.60,
			},
		},
	},
	pickers = {
		current_buffer_fuzzy_find = { sorting_strategy = "ascending" },
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})
require("telescope").load_extension("fzy_native")
