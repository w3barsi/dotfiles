local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.vimls.setup{}
