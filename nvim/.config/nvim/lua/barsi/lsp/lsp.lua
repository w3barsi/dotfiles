
-- JavaScript/TypeScript
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').tsserver.setup{
  capabilities = capabilities
}

-- HTML
local capabilities_html = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup {
  capabilities = capabilities_html,
}

-- CSS
require('lspconfig').cssls.setup{}

-- TailWind CSS
require('lspconfig').tailwindcss.setup{}

require('lspconfig').eslint.setup{}

require('lspconfig').pyright.setup{}

require('lspconfig').ccls.setup{}

require'lspconfig'.vimls.setup{}
