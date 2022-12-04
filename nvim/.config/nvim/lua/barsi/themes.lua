vim.g.barstrata_italic_comments = true
vim.g.barstrata_italic_keywords = false
vim.g.barstrata_italic_booleans = false
vim.g.barstrata_italic_functions = false
vim.g.barstrata_italic_variables = false
vim.g.barstrata_italic_types = true
vim.g.barstrata_transparent = false



require("colorizer").setup({
	user_default_options = {
		names = false,
	},
})

local theme = require("last-color").recall() or "barstrata"
vim.cmd(("colorscheme %s"):format(theme))
