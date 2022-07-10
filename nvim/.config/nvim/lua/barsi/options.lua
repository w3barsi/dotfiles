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
