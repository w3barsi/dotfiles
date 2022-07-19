vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = "lua vim.lsp.buf.format()"
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = { "*" },
    command = "write",
})


