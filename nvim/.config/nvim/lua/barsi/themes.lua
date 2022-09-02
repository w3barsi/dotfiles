--vim.cmd [[colorscheme darkplus]]
--vim.cmd[[colorscheme nord]]
--vim.cmd[[colorscheme poimandres]]
vim.cmd[[colorscheme poimandress]]

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true

require('colorizer').setup {
  '*',
  DEFAULT_OPTIONS = {
    RGB      = true; -- #RGB hex codes
    RRGGBB   = true; -- #RRGGBB hex codes
    names    = true; -- "Name" codes like Blue
    RRGGBBAA = false; -- #RRGGBBAA hex codes
    rgb_fn   = false; -- CSS rgb() and rgba() functions
    hsl_fn   = false; -- CSS hsl() and hsla() functions
    css      = true; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = true; -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes: foreground, background
    mode     = 'background'; -- Set the display mode.
  }
}

--function searchCount()
--local search = vim.fn.searchcount({ maxcount = 0 }) -- maxcount = 0 makes the number not be capped at 99
--local searchCurrent = search.current
--local searchTotal = search.total
--if searchCurrent > 0 then
--return "/" .. vim.fn.getreg("/") .. " [" .. searchCurrent .. "/" .. searchTotal .. "]"
--else
--return ""
--end
--end

