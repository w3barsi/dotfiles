require('barsi.telescope')
require('barsi.lsp')
require('barsi.terminal')
require('nvim-autopairs').setup{}


require('lualine').setup{ 
  options = {
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = '│'},
    section_separators = { left = '', right = ''},
  },
}

