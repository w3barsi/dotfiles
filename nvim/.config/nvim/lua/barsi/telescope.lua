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
				["<esc>"] = actions.close,
			},
		},
		file_ignore_patterns = {
			"node_modules",
			".git",
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
				preview_width = 0.60,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})
require("telescope").load_extension("fzy_native")
