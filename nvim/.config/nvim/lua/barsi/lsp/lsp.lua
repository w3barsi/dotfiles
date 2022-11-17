require("nvim-lsp-installer").setup({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})
-- vimls html sumneko_lua bashls yamlls prismals clangd eslint intelephense jsonls tailwindcss tsserver cssls vimls rust_analyzer taplo astro emmet_ls efm php dockerls taplo bashls
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

local on_attach = require("barsi.remap").on_attach
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
lspconfig.emmet_ls.setup(default_config)
lspconfig.prismals.setup(default_config)
lspconfig.intelephense.setup(default_config)
lspconfig.rust_analyzer.setup(default_config)
lspconfig.vuels.setup(default_config)
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
