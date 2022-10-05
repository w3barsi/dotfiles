if vim.fn.exists("g:neovide") == 0 then
    return
end

local nnoremap = require("barsi.keymaps").nnoremap
local vnoremap = require("barsi.keymaps").vnoremap

vim.g.gui_font_default_size = 15
vim.g.neovide_refresh_rate = 165
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "JetBrainsMonoNL NF"
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


vnoremap("<A-k>", [[:m '<-2<CR>gv=gv]], { silent = true })
vnoremap("J", [[:m '>+1<CR>gv=gv]], { silent = true })

local opts = { noremap = true, silent = true }


vim.keymap.set({ "n", "i" }, "<C-+>", function()
    ResizeGuiFont(1)
end, opts)
vim.keymap.set({ "n", "i" }, "<C-->", function()
    ResizeGuiFont(-1)
end, opts)
