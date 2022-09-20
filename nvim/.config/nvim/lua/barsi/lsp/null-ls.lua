--local null_ls_status_ok, null_ls = pcall(require, "null-ls")
--if not null_ls_status_ok then
--return
--end

--local formatting = null_ls.builtins.formatting
--local diagnostics = null_ls.builtins.diagnostics

--null_ls.setup({
--debug = false,
--sources = {
--formatting.prettier,
--}
--})

local null_ls = require("null-ls")

local sources = {
  --null_ls.builtins.formatting.prettier.with({
    --filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html",
      --"json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "astro" }
  --}),

  null_ls.builtins.formatting.prettierd.with({
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html",
      "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "astro" }
  }),
}

require("null-ls").setup({
  sources = sources
})
