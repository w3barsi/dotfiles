vim.g.github_comment_style = "NONE"
vim.g.github_keyword_style = "NONE"
vim.g.github_function_style = "italic"
vim.g.github_variable_style = "NONE"
vim.g.github_dark_sidbar = 1

vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true

require('colorizer').setup {
  user_default_options = {
    names = false;
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

--vim.cmd [[colorscheme darkplus]]
--vim.cmd[[colorscheme poimandres]]
--vim.cmd[[colorscheme poimandress]]
--vim.cmd[[colorscheme github_dark]]
--vim.cmd[[colorscheme github_dimmed]]
--vim.cmd[[colorscheme github_dark_default]]
--vim.cmd[[colorscheme vimdark]]
--vim.cmd[[colorscheme onedarkpro]]
vim.cmd [[colorscheme substrata]]
--vim.cmd[[colorscheme nord]]
