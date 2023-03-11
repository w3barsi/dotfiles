local nnoremap = require("barsi.scripts.keymaps").nnoremap
local inoremap = require("barsi.scripts.keymaps").inoremap
local vnoremap = require("barsi.scripts.keymaps").vnoremap
local xnoremap = require("barsi.scripts.keymaps").xnoremap

local lsp = require("lsp-zero")
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("neodev").setup({})

lsp.preset("recommended")
lsp.ensure_installed({
	"eslint",
	"rust_analyzer",
})

require("lsp_signature").setup({
	floating_window = false,
	hint_enable = true, -- virtual hint enable
	hint_prefix = "🐼 ",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
	["<C-e>"] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),
	["<CR>"] = cmp.mapping.confirm(),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	-- nnoremap( "K", vim.lsp.buf.hover, { buffer = 0 })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "[g]oto [d]efinition", buffer = 0 })
	nnoremap("gD", vim.lsp.buf.type_definition, { desc = "[g]oto type [D]efinition", buffer = 0 })
	nnoremap("gi", vim.lsp.buf.implementation, { desc = "[g]oto [i]mplementation", buffer = 0 })
	-- nnoremap("gr", vim.lsp.buf.references, { desc = "Go to references [LSP]", buffer = 0 })
	nnoremap("gr", function()
		require("telescope.builtin").lsp_references()
	end, { desc = "[g]oto [r]eferenfecs", buffer = 0 })
	nnoremap("gf", vim.lsp.buf.format, { desc = "[g]o [f]ormat", buffer = 0 })

	nnoremap("]e", vim.diagnostic.goto_next, { buffer = 0 })
	nnoremap("[e", vim.diagnostic.goto_prev, { buffer = 0 })
	nnoremap("<leader>dp", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })

	-- LSP Saga Keymaps
	nnoremap("K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, buffer = 0 })
	nnoremap("ga", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
	nnoremap("gca", "<cmd>Lspsaga code_action<CR>", { silent = true })
	vnoremap("gca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
	nnoremap("<F2>", ":IncRename ", { silent = true, buffer = 0 })

	if client.name == "tsserver" then
		nnoremap("gt", function()
			require("typescript").actions.organizeImports()
			require("typescript").actions.removeUnused()
			require("typescript").actions.addMissingImports()
		end, { desc = "Adds, Organize Inputs and Removes Unused Imports" })

		nnoremap(
			"ta",
			":lua require('typescript').actions.addMissingImports()<CR>",
			{ desc = "[T]ypescript [A]dd Missing Imports", buffer = bufnr }
		)

		nnoremap(
			"to",
			":lua require('typescript').actions.organizeImports()<CR>",
			{ desc = "[T]ypescript [O]rganize Imports", buffer = bufnr }
		)

		nnoremap(
			"tr",
			":lua require('typescript').actions.removeUnused()<CR>",
			{ desc = "[T]ypescript [R]emove Unused Imports", buffer = bufnr }
		)
	end
end)

lsp.configure("lua_ls", {
	settings = {
		Lua = {
			cmpletion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = {
					"vim",
				},
			},
		},
	},
})

lsp.configure("tailwindcss", {
	-- force_setup = true,
	cmd = { "tailwindcss-language-server", "--stdio" },
})

lsp.configure("tsserver", {
	-- force_setup = true,
	cmd = { "typescript-language-server", "--stdio" },
})


lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

-- require("lspconfig").tailwindcss.setup({
-- 	cmd = { "node", "/Users/kuya/.bun/bin/tailwindcss-language-server", "--stdio" },
-- })
