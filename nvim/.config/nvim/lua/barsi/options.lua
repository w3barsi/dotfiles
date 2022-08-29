vim.g.mapleader = " "

vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.opt.encoding = "UTF-8"
vim.opt.fillchars = {
    vert = " ",
    eob = " "
}
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.hlsearch = false

vim.opt.mouse= "a"
vim.opt.mousefocus = true

vim.opt.encoding= "utf-8"

vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir= vim.fn.stdpath("data") .. "undo"
vim.opt.undofile = true
vim.opt.incsearch = true
--vim.opt.colorcolumn=80
vim.opt.scrolloff=8
vim.opt.laststatus=2
vim.opt.signcolumn= "yes:1"
vim.opt.clipboard = "unnamedplus"
vim.opt.lazyredraw = true
vim.opt.updatetime=50
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.backspace = "indent,eol,start"

vim.cmd[[highlight GitSignsAdd guibg=NONE]]
vim.cmd[[highlight GitSignsAdd guifg=#b8bb26]]
vim.cmd[[highlight GitSignsChange guibg=NONE]]
vim.cmd[[highlight GitSignsChange guifg=#fe8019]]
vim.cmd[[highlight GitSignsDelete guibg=NONE]]
vim.cmd[[highlight GitSignsDelete guifg=#fb4934]]
