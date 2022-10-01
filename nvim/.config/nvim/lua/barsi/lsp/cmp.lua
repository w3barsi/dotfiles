local lspkind = require("lspkind")
local cmp = require("cmp")

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_snipmate").lazy_load({ paths = "./snippets" })
require("luasnip/loaders/from_vscode").lazy_load()

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			--vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	--window = {
	----completion = { border = border,},
	----documentation = { border = border },
	--},
	mapping = {
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm(),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = cmp.config.sources(
		{
			{ name = "nvim_lsp_signature_help" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			--{ name = 'ultisnips' }, -- For ultisnips users.
		}
		--{
		--{ name = 'buffer' },
		--}
	),
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			return vim_item
		end,
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

--local border = {
--{ "┌", "CmpBorder" },
--{ "─", "CmpBorder" },
--{ "┐", "CmpBorder" },
--{ "│", "CmpBorder" },
--{ "┘", "CmpBorder" },
--{ "─", "CmpBorder" },
--{ "└", "CmpBorder" },
--{ "│", "CmpBorder" },
--}

--format = lspkind.cmp_format({
--with_text = true,
--mode = 'symbol_text',
--menu = {
--luasnip = "[SNIP]",
--nvim_lsp = "[LSP]",
--nvim_lua = "[API]",
--buffer = "[BUF]",
----ultisnips = "[SNIP]",
--}
--})
