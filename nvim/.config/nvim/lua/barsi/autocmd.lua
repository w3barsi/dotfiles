vim.api.nvim_create_autocmd({"InsertLeave"}, {
    pattern = {"*"},
    command = "write",
})
