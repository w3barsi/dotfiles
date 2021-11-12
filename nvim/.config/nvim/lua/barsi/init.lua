require('barsi.telescope')
require('barsi.lsp')
require('barsi.terminal')
require('nvim-autopairs').setup{}

require('nvim-tree').setup{}
require('colorizer').setup{
  '*',
  DEFAULT_OPTIONS = {
    RGB      = true;         -- #RGB hex codes
    RRGGBB   = true;         -- #RRGGBB hex codes
    names    = true;         -- "Name" codes like Blue
    RRGGBBAA = false;        -- #RRGGBBAA hex codes
    rgb_fn   = false;        -- CSS rgb() and rgba() functions
    hsl_fn   = false;        -- CSS hsl() and hsla() functions
    css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes: foreground, background
    mode     = 'background'; -- Set the display mode.
  }
}

require('lualine').setup{ 
  options = {
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = '│'},
    section_separators = { left = '', right = ''},
  },
}

