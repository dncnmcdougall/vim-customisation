-- nvim-cmp
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		-- ['<tab>'] = function(fallback)
		--     if cmp.visible() then
		--         cmp.select_next_item()
		--     else
		--         fallback()
		--     end
		-- end,
		-- ['<S-tab>'] = function(fallback)
		--     if cmp.visible() then
		--         cmp.select_prev_item()
		--     else
		--         fallback()
		--     end
		-- end,
		["<tab>"] = function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			else
				fallback()
			end
		end,
		["<C-J>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "treesitter", keyword_length = 3 },
	}, {
		{ name = "buffer", keyword_length = 3 },
	}, {
		-- {
		--     name = 'spell',
		--     keyword_length=3,
		--     option = {
		--         keep_all_entries = false,
		--         enable_in_context = function()
		--             return true
		--         end,
		--     },
		-- }
	}),
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				lsp = "[lsp]",
				treesitter = "[tree]",
				buffer = "[buf]",
				luasnip = "[snip]",
				path = "[path]",
				-- spell = '[spell]',
			},
		}),
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer", keyword_length = 3 },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			else
				fallback()
			end
		end,
		["<C-J>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline", keyword_length = 3 },
	}),
})
