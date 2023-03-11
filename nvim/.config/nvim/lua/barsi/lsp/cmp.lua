local lspkind = require("lspkind")
local cmp = require("cmp")

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

-- require("luasnip/loaders/from_snipmate").lazy_load({ paths = "./snippets" })
-- require("luasnip/loaders/from_vscode").lazy_load()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	--window = {
	----completion = { border = border,},
	----documentation = { border = border },
	--},

	mapping = {
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
		["<C-s>"] = function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end,
	},

	sources = cmp.config.sources(
		{
			{ name = "path" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "luasnip" },
			-- { name = "nvim_lsp_signature_help" },
		}
		--{
		--{ name = 'buffer' },
		--}
	),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    [" .. strings[2] .. "]"

			return kind
		end,
		-- format = function(_, vim_item)
		-- 	vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
		-- 	return vim_item
		-- end,
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
--

-- local kind_icons = {
-- 	Text = "",
-- 	Method = "",
-- 	Function = "",
-- 	Constructor = "",
-- 	Field = "ﰠ",
-- 	Variable = "",
-- 	Class = "ﴯ",
-- 	Interface = "",
-- 	Module = "",
-- 	Property = "ﰠ",
-- 	Unit = "塞",
-- 	Value = "",
-- 	Enum = "",
-- 	Keyword = "",
-- 	Snippet = "",
-- 	Color = "",
-- 	File = "",
-- 	Reference = "",
-- 	Folder = "",
-- 	EnumMember = "",
-- 	Constant = "",
-- 	Struct = "פּ",
-- 	Event = "",
-- 	Operator = "",
-- 	TypeParameter = "",
-- }
--
