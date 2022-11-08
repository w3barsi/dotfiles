--require('lualine').setup {
--sections = {
--lualine_x = { { searchCount }, 'tabs', 'fileformat', 'filetype' },
--}
--}

require("lualine").setup({
	options = {
		theme = "auto",
		component_separators = { left = "", right = "│" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree" },
	},
})
