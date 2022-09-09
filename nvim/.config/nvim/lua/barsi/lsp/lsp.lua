require("nvim-lsp-installer").setup {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

local on_attach = require("barsi.remap").on_attach

local saga = require('lspsaga')
saga.init_lsp_saga()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- vimls html sumneko_lua bashls yamlls prismals ccls clangd eslint intelephense jsonls tailwindcss tsserver cssls vimls

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


--local cfg = {
  --floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  --hint_enable = false, -- virtual hint enable
  --handler_opts = {
    --border = "single" -- double, rounded, single, shadow, none
  --},
--}

--require('lsp_signature').setup(cfg)
