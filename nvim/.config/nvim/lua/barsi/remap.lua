local nnoremap = require("barsi.scripts.keymaps").nnoremap
local inoremap = require("barsi.scripts.keymaps").inoremap
local vnoremap = require("barsi.scripts.keymaps").vnoremap
local xnoremap = require("barsi.scripts.keymaps").xnoremap
local L = {}

-- Navige around vim-illuminate
nnoremap("]d", ":lua require('illuminate').goto_next_reference(wrap)<CR>", { silent = true })
nnoremap("[d", ":lua require('illuminate').goto_prev_reference(wrap)<CR>", { silent = true })

-- Add semicolon to end
nnoremap(";;", "A;<Esc>")

-- Paste without changing clipboard buffer
xnoremap("<leader>p", '"_dP')

--nnoremap("<leader>n", ":RunFile toggleterm<CR>")
nnoremap("<leader>n", [[:! tmux send-keys -t 1 "cargo run" Enter <CR>]])
nnoremap("<leader><Tab>", ":TSHi<cr>", { silent = true })

nnoremap("<leader>u", "<cmd>UndotreeShow<CR>")
--nnoremap("<leader><Tab>", "<cmd>tabn<CR>") -- go to next tab
nnoremap("Y", "y$") -- yank to eol

-- Rename all in buffer
nnoremap("<leader><F2>", [[ :%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left> ]])
vnoremap("<F2>", ":s/")
--Rename in Visual Mode
--vnoremap("<leader>")

-- [[NAVIGATION]]
-- Jumps to End or Beginning of Paragraph
--nnoremap("<C-j>", [[:keepjumps normal! j}k<cr>]], { noremap = true, silent = true })
--nnoremap("<C-k>", [[:keepjumps normal! k{j<cr>]], { noremap = true, silent = true })
-- Centers C-d and C-u
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Move Text in Visual Block Up or Down
nnoremap("<A-k>", [[V:m '<-2<CR>gv=]], { silent = true })
nnoremap("<A-j>", [[V:m '>+1<CR>gv=]], { silent = true })
vnoremap("<A-k>", [[:m '<-2<CR>gv=gv]], { silent = true })
vnoremap("<A-j>", [[:m '>+1<CR>gv=gv]], { silent = true })
inoremap("<A-k>", [[<esc>:m .-2<CR>==a]], { silent = true })
inoremap("<A-j>", [[<esc>:m .+1<CR>==a]], { silent = true })
-- Keep visual mode after indent
vnoremap(">", ">gv", { silent = true })
vnoremap("<", "<gv", { silent = true })

-- Move text under cursor

-- Ctrl + BS Erases a word
-- Using vim.cmd for now
vim.cmd([[noremap! <C-BS> <C-w>]])
vim.cmd([[noremap! <C-h> <C-w>]])
nnoremap("x", [["_x]])

-- Telescope and NvimTree keybindings
nnoremap("<leader>pp", [[:NvimTreeToggle<CR>]], { silent = true })

nnoremap("<C-p>", ":lua require('telescope.builtin').find_files({hidden=true})<cr>", { silent = true })
nnoremap("<C-f>", ":lua require('telescope.builtin').live_grep({hidden=true})<cr>", { silent = true })
nnoremap("<leader>tb", ":lua require('telescope.builtin').buffers()<cr>", { silent = true })
nnoremap("<leader>th", ":lua require('telescope.builtin').help_tags()<cr>", { silent = true })
nnoremap("<leader>tc", ":lua require('telescope.builtin').commands()<cr>", { silent = true })
nnoremap(
	"<Leader>css",
	":lua require('telescope.builtin').colorscheme(require('telescope.themes').get_dropdown({}))<cr>",
	{ silent = true }
)

nnoremap("<leader>gg", [[:LazyGit<CR>]], { silent = true })

--nnoremap("co", [[:copen<CR>]], {sileng = true})
--nnoremap("cj", [[:cnext<CR>]], {sileng = true})
--nnoremap("ck", [[:cprev<CR>]], {sileng = true})

--Deprecated / Moved to Hydra Maps
--nnoremap("<Leader>-", "<cmd>vertical resize -4<CR>")
--nnoremap("<Leader>=", "<cmd>vertical resize +5<CR>")
-- nnoremap("<leader>h", "<cmd>wincmd h <CR>")
-- nnoremap("<leader>j", "<cmd>wincmd j <CR>")
-- nnoremap("<leader>k", "<cmd>wincmd k <CR>")
-- nnoremap("<leader>l", "<cmd>wincmd l <CR>")

-- Commented as I forgot what these mappings do
--nnoremap("n", "nzzzv")
--nnoremap("N", "nzzzv")
--nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . "k"
--nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . "j"

-- [[ LSP ]]
local open_float = function()
	local opts = {
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = "rounded",
	}
	vim.api.nvim_command(
		'lua vim.diagnostic.open_float(nil, {close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" }, border = "single",})'
	)
end

local on_attach = function(client, bufnr)
	-- nnoremap( "K", vim.lsp.buf.hover, { buffer = 0 })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "Go to definition [LSP]", buffer = 0 })
	nnoremap("gt", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = 0 })
	nnoremap("gi", vim.lsp.buf.implementation, { desc = "Go to implementation [LSP]", buffer = 0 })
	-- nnoremap("gr", vim.lsp.buf.references, { desc = "Go to references [LSP]", buffer = 0 })
	nnoremap("gr", function()
		require("telescope.builtin").lsp_references()
	end, { desc = "Go to references [LSP]", buffer = 0 })
	nnoremap("gf", vim.lsp.buf.format, { buffer = 0 })
	nnoremap("fd", [[gg=G<C-o>]], { buffer = 0, silent = true })

	nnoremap("?", open_float, { buffer = 0 })
	nnoremap("]e", vim.diagnostic.goto_next, { buffer = 0 })
	nnoremap("[e", vim.diagnostic.goto_prev, { buffer = 0 })
	nnoremap("<leader>dp", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })

	-- LSP Saga Keymaps
	nnoremap("K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, buffer = 0 })
	nnoremap("ga", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
	nnoremap("gca", "<cmd>Lspsaga code_action<CR>", { silent = true })
	vnoremap("gca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
	nnoremap("<F2>", "<cmd>Lspsaga rename<CR>", { silent = true, buffer = 0 })

	if client.name == "tsserver" then
		vim.keymap.set(
			"n",
			"<Leader>oi",
			"<Cmd>OrganizeImports<CR>",
			{ desc = "Organize imports [TS]", buffer = bufnr }
		)
	end
end

L.on_attach = on_attach
return L
