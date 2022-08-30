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

require("null-ls").setup({
  debug = false,
  sources = {
    null_ls.builtins.formatting.prettier,
    --null_ls.builtins.formatting.clang_format
  },
})
