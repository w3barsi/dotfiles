require("nvim-lsp-installer").setup {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())



on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
    vim.keymap.set("n", "gf", vim.lsp.buf.formatting, {buffer=0})
    vim.keymap.set("n", "gca", vim.lsp.buf.code_action, {buffer=0})
    vim.keymap.set("n", "R", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dp", "<cmd>Telescope diagnostics<cr>", {buffer=0})
end

require('lspconfig').clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').bashls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').sumneko_lua.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').vimls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').cssls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').tsserver.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').tailwindcss.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').jsonls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').html.setup{
    on_attach = on_attach,
    capabilities = capabilities
}



