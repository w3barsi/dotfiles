local autocmd = vim.api.nvim_create_autocmd
local nnoremap = require("barsi.scripts.keymaps").nnoremap
--vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--pattern = { "*" },
--command = "lua vim.lsp.buf.format()"
--})

--vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--pattern = { "*" },
--command = "write",
--})
--

--vim.cmd[[autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2]]
--vim.cmd[[autocmd FileType c setlocal shiftwidth=4 tabstop=4 softtabstop=4]]
--vim.cmd[[autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab]]
--vim.cmd[[autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 expandtab]]
--vim.cmd[[autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 expandtab]]
--vim.cmd[[autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 expandtab]]
--vim.cmd[[autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab]]
--vim.cmd[[autocmd FileType jsonc setlocal shiftwidth=2 tabstop=2 expandtab]]
--

-- Briefly highlight code on yank
local yank_group = vim.api.nvim_create_augroup("YankGroup", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 250 })
	end,
	desc = "Briefly highlight code on yank",
})
