require("nvim-lsp-installer").setup {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

local saga = require('lspsaga')
saga.init_lsp_saga()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local open_float = function()
    local opts = {
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
    }
    vim.api.nvim_command('lua vim.diagnostic.open_float(nil, {close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" }, border = "rounded",})')
end

local on_attach = function()
    --vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
    vim.keymap.set("n", "gf", vim.lsp.buf.format, { buffer = 0 })
    vim.keymap.set("n", "gca", vim.lsp.buf.code_action, { buffer = 0 })
    --vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true, buffer = 0 })
    vim.keymap.set("n", "?", open_float, { buffer = 0 })
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })

end

-- vimls html sumneko_lua bashls yamlls prismals ccls clangd eslint intelephense jsonls tailwindcss tsserver cssls

require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

--require('lspconfig').ccls.setup {
    --on_attach = on_attach,
    --capabilities = capabilities
--}

require('lspconfig').bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }

    }
}

require('lspconfig').vimls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}



require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').html.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').prismals.setup {
    on_attach = on_attach,
    capabilities = capabilities
}


local cfg = {
    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

    hint_enable = false, -- virtual hint enable
    handler_opts = {
        border = "single" -- double, rounded, single, shadow, none
    },
}

--require('lsp_signature').setup(cfg)
