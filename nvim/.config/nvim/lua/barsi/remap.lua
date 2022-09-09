local nnoremap = require('barsi.keymaps').nnoremap
local inoremap = require('barsi.keymaps').inoremap
local vnoremap = require('barsi.keymaps').vnoremap
local L = {}

nnoremap(";;", "A;<Esc>")

nnoremap("<leader>n", ":RunFile toggleterm<CR>")
nnoremap("<leader><Tab>", ":TSHi<cr>", {silent = true})

nnoremap("<leader>u", "<cmd>UndotreeShow<CR>")
--nnoremap("<leader><Tab>", "<cmd>tabn<CR>") -- go to next tab
nnoremap("Y", "y$") -- yank to eol
-- Rename all in buffer
nnoremap("<leader><F2>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- [[NAVIGATION]]
-- Jumps to End or Beginning of Paragraph
nnoremap("<C-j>", [[:keepjumps normal! j}k<cr>]], { noremap = true, silent = true })
nnoremap("<C-k>", [[:keepjumps normal! k{j<cr>]], { noremap = true, silent = true })
vnoremap("<C-j>", [[j}k]], { noremap = true, silent = true })
vnoremap("<C-k>", [[k{j]], { noremap = true, silent = true })
-- Centers C-d and C-u
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Make new line above or below current line
inoremap("<S-CR>", "<Esc>O")
inoremap("<C-CR>", "<Esc>o")

-- Use Ctrl + / to comment a line or a visual block
nnoremap("<C-_>", [[<Plug>NERDCommenterToggle]])
vnoremap("<C-_>", [[<Plug>NERDCommenterToggle]])

-- Move Text in Visual Block Up or Down
vnoremap("K", [[:m '<-2<CR>gv=gv]], { silent = true })
vnoremap("J", [[:m '>+1<CR>gv=gv]], { silent = true })

-- Move text under cursor
inoremap("<C-j>", [[ <esc>:m .+1<CR>== ]], { silent = true })
inoremap("<C-k>", [[ <esc>:m .-2<CR>== ]], { silent = true })


-- Ctrl + BS Erases a word
-- Using vim.cmd for now
vim.cmd [[noremap! <C-BS> <C-w>]]
vim.cmd [[noremap! <C-h> <C-w>]]


-- Telescope and NvimTree keybindings
nnoremap("<leader>pp", [[:NvimTreeToggle<CR>]], { silent = true })

nnoremap("<C-p>", ":lua require('telescope.builtin').find_files({hidden=true})<cr>", { silent = true })
nnoremap("<C-f>", ":lua require('telescope.builtin').live_grep({hidden=true})<cr>", { silent = true })
nnoremap("<leader>pb", ":lua require('telescope.builtin').buffers()<cr>", { silent = true })
nnoremap("<leader>ph", ":lua require('telescope.builtin').help_tags()<cr>", { silent = true })
nnoremap("<leader>pc", ":lua require('telescope.builtin').commands()<cr>", { silent = true })
nnoremap("<Leader>css", ":lua require('telescope.builtin').colorscheme(require('telescope.themes').get_dropdown({}))<cr>"
  , { silent = true })

nnoremap("<leader>pi", [[:source %<CR> :PlugInstall<CR>]], { silent = true })
nnoremap("<leader>gg", [[:LazyGit<CR>]], { silent = true })

--nnoremap("co", [[:copen<CR>]], {sileng = true})
--nnoremap("cj", [[:cnext<CR>]], {sileng = true})
--nnoremap("ck", [[:cprev<CR>]], {sileng = true})

--Deprecated / Moved to Hydra Maps
--nnoremap("<Leader>-", "<cmd>vertical resize -4<CR>")
--nnoremap("<Leader>=", "<cmd>vertical resize +5<CR>")
nnoremap("<leader>h", "<cmd>wincmd h <CR>")
nnoremap("<leader>j", "<cmd>wincmd j <CR>")
nnoremap("<leader>k", "<cmd>wincmd k <CR>")
nnoremap("<leader>l", "<cmd>wincmd l <CR>")


-- Commented as I forgot what these mappings do
--nnoremap("n", "nzzzv")
--nnoremap("N", "nzzzv")
--nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . "k"
--nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . "j"

vim.g['UltiSnipsJumpForwardTrigger'] = "<C-j>"
vim.g['UltiSnipsJumpBackwordTrigger'] = "<C-k>"

-- REFACTORING
vnoremap("<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vnoremap("<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vnoremap("<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vnoremap("<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})


-- [[ LSP ]]
local open_float = function()
  local opts = {
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = 'rounded',
  }
  vim.api.nvim_command('lua vim.diagnostic.open_float(nil, {close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" }, border = "single",})')
end

local on_attach = function()
  --vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, buffer = 0 })

  nnoremap("ga", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
  vim.keymap.set("n", "gf", vim.lsp.buf.format, { buffer = 0 })
  vim.keymap.set("n", "fd", [[gg=G<C-o>]], { buffer = 0, silent = true })

  --vim.keymap.set("n", "gca", vim.lsp.buf.code_action, { buffer = 0 })
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
  vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

  --vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true, buffer = 0 })

  vim.keymap.set("n", "?", open_float, { buffer = 0 })
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
  vim.keymap.set("n", "<leader>dp", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
end


L.on_attach = on_attach
return L
