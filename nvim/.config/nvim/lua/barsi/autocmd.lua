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
