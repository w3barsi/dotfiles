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
	require("typescript.extensions.null-ls.code-actions"),
	null_ls.builtins.formatting.prettier,
	-- null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.markdownlint,
}

require("null-ls").setup({
	sources = sources,
})
