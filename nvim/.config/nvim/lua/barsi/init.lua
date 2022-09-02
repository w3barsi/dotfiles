require('impatient')
-- User Settings
require('barsi.options')
require('barsi.remap')
require('barsi.hydra')

-- LSP Settings
require('barsi.lsp.lsp')
require('barsi.lsp.cmp')
require('barsi.lsp.null-ls')
require('barsi.lsp.treesitter')

-- Plugin Settings
require('barsi.autocmd')
require('barsi.autotag')
require('barsi.code_runner')
require('barsi.git')
require('barsi.indentline')
require('barsi.lualine')
require('barsi.nvim-tree')
require('barsi.telescope')
require('barsi.terminal')
require('barsi.themes')
require('barsi.transparent')

--vim.keymap.set("i", "<C-c>", [[copilot#Accept("\<CR>")]])
--vim.g['copilot_no_tab_map'] = true


