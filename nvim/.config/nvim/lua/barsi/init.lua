--require('barsi.lsp.cmp')
--require('barsi.lsp.lsp')
--require('barsi.lsp.treesitter')
require('barsi.file_nav')
require('barsi.terminal')
require('barsi.themes')
require('nvim-autopairs').setup{}

require("transparent").setup({
  enable = false, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})


