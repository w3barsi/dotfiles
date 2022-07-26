local nnoremap = require('barsi.keymaps').nnoremap
local inoremap = require('barsi.keymaps').inoremap

nnoremap("n", "nzzzv")
nnoremap("N", "nzzzv")
nnoremap("<leader>h", "<cmd>wincmd h <CR>")
nnoremap("<leader>j", "<cmd>wincmd j <CR>")
nnoremap("<leader>k", "<cmd>wincmd k <CR>")
nnoremap("<leader>l", "<cmd>wincmd l <CR>")
nnoremap("<leader>u", "<cmd>UndotreeShow<CR>")
nnoremap("<Leader>-", "<cmd>vertical resize -5<CR>")
nnoremap("<Leader>=", "<cmd>vertical resize +5<CR>")
nnoremap("<leader><Tab>", "<cmd>tabn<CR>") -- go to next tab
nnoremap("Y", "y$") -- yank to eol

inoremap("<S-CR>", "<Esc>O")
inoremap("<C-CR>", "<Esc>o")


