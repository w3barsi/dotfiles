if vim.fn.exists("g:neovide") == 0 then
    return
end

local vnoremap = require("barsi.scripts.keymaps").vnoremap

vim.g.neovide_refresh_rate = 60
vim.g.neovide_cursor_trail_size = 0

vim.g.gui_font_default_size = 15
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "JetBrainsMono Nerd Font"

RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    RefreshGuiFont()
end

ResetGuiFont = function()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps


local opts = { noremap = true, silent = true }


vim.keymap.set({ "n"}, "+", function()
    ResizeGuiFont(1)
end, opts)
vim.keymap.set({ "n"}, "_", function()
    ResizeGuiFont(-1)
end, opts)
