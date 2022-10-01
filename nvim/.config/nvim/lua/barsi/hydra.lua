local Hydra = require("hydra")

Hydra({
	name = "Window Commands",
	mode = { "n" },
	body = "<C-w>",
	config = {
		-- color = 'pink'
	},
	heads = {
		-- Pointer Movements
		{ "h", "<C-w>h" },
		{ "j", "<C-w>j" },
		{ "k", "<C-w>k" },
		{ "l", "<C-w>l" },

		-- Window Resizing
		{ "H", "<C-w>3>" },
		{ "L", "<C-w>3<" },
		{ "K", "<C-w>2+" },
		{ "J", "<C-w>2-" },

		-- Equally Resize
		{ "e", "<C-w>=" },

		-- Close active window
		{ "q", ":q<cr>" },

		-- Exit hydra
		{ "<cr>", nil, { exit = true, nowait = true } },
	},
})
