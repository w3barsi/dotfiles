vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins')

-- User Settings
require("barsi.autocmd")
require("barsi.options")
-- require("barsi.remap")
require("barsi.terminal")
require("barsi.themes")
require("barsi.neovide")

-- LSP Settings
require("barsi.lsp.lsp")
-- require("barsi.lsp.cmp")
require("barsi.lsp.null-ls")
require("barsi.lsp.treesitter")


-- Plugin Settings
require("barsi.plugins.autotag")
require("barsi.plugins.code_runner")
require("barsi.plugins.comment")
require("barsi.plugins.git")
require("barsi.plugins.harpoon")
-- require("barsi.plugins.hydra")
require("barsi.plugins.illuminate")
require("barsi.plugins.indentline")
require("barsi.plugins.lualine")
require("barsi.plugins.nvim-tree")
require("barsi.plugins.telescope")
require("barsi.plugins.presence")
-- require("barsi.plugins.whichkey")
