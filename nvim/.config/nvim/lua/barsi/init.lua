require('barsi.lsp.cmp')
require('barsi.lsp.lsp')
require('barsi.lsp.treesitter')
require('barsi.file_nav')
require('barsi.terminal')
require('barsi.themes')
require('nvim-autopairs').setup{}


require'lspinstall'.setup() -- important
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end

