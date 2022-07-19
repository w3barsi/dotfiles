local options = {
  encoding = "UTF-8",
  clipboard = "unnamedplus",
  autoread = true,
  rnu = true,
  nu = true,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

--vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
-- Diagnostics on Cursor Hold
