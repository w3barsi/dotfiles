local nnoremap = require("barsi.scripts.keymaps").nnoremap
local inoremap = require("barsi.scripts.keymaps").inoremap
local vnoremap = require("barsi.scripts.keymaps").vnoremap
local xnoremap = require("barsi.scripts.keymaps").xnoremap

require("mason").setup({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup()

-- vimls html sumneko_lua bashls yamlls prismals clangd eslint intelephense jsonls tailwindcss tsserver cssls vimls rust_analyzer taplo astro emmet_ls efm php dockerls volar
local tw_highlight = require("tailwind-highlight")
local lspconfig = require("lspconfig")
local saga = require("lspsaga")
saga.init_lsp_saga()

require("lsp_signature").setup({
	floating_window = false,
	hint_enable = true, -- virtual hint enable
	hint_prefix = "🐼 ",
})

vim.diagnostic.config({
	underline = { severity_limit = "Error" },
	signs = true,
	update_in_insert = false,
})


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

-- L.on_attach = on_attach
-- return L

-- local on_attach = require("barsi.remap").on_attach
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

local default_config = {
	on_attach = on_attach,
	capabilities = capabilities,
}

lspconfig.html.setup(default_config)
lspconfig.astro.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.taplo.setup(default_config)
lspconfig.vimls.setup(default_config)
lspconfig.bashls.setup(default_config)
lspconfig.clangd.setup(default_config)
lspconfig.eslint.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.yamlls.setup(default_config)
-- lspconfig.emmet_ls.setup(default_config)
lspconfig.prismals.setup(default_config)
lspconfig.intelephense.setup(default_config)
lspconfig.rust_analyzer.setup(default_config)
-- lspconfig.vuels.setup(default_config)
lspconfig.volar.setup(default_config)
lspconfig.bashls.setup(default_config)

-- lspconfig.sumneko_lua.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 		},
-- 	},
-- })

local lua_rtp = vim.split(package.path, ";")
table.insert(lua_rtp, "lua/?.lua")
table.insert(lua_rtp, "lua/?/init.lua")

lspconfig.sumneko_lua.setup(vim.tbl_extend("force", default_config, {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = lua_rtp,
			},
			diagnostics = { globals = { "vim" } },
			-- workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
}))

lspconfig.tailwindcss.setup({
	on_attach = function(client, bufnr)
		tw_highlight.setup(client, bufnr, {
			single_column = false,
			mode = "background",
			debounce = 200,
		})

		on_attach(client, bufnr)
	end,
})

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			on_attach()
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

--require('lspconfig').ccls.setup {
--on_attach = on_attach,
--capabilities = capabilities
--}

--local cfg = {
--floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

--hint_enable = false, -- virtual hint enable
--handler_opts = {
--border = "single" -- double, rounded, single, shadow, none
--},
--}

--require('lsp_signature').setup(cfg)
--
