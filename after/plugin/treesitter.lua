-- Treesitter
vim.opt.runtimepath:append("~/compiled_software/ts-parsers")
require("nvim-treesitter.configs").setup({
	parser_install_dir = "~/compiled_software/ts-parsers",
	ensure_installed = {
		"bash",
		"bibtex",
		"c",
		"c_sharp",
		"cmake",
		"comment",
		"cpp",
		"cooklang",
		"css",
		"dockerfile",
		"dot",
		"help",
		"html",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"kotlin",
		"latex",
		"lua",
		"make",
		"markdown",
		"ninja",
		"norg",
		"ocaml",
		"pascal",
		"python",
		"regex",
		"rust",
		"toml",
		"typescript",
		"vim",
		"yaml",
		"zig",
	},
	highlight = {
		enable = true,
		disable = { "latex", "tex" },
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "latex", "tex" },
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			disable = { "latex", "tex" },
			clear_on_cursor_move = true,
		},
		highlight_current_scope = {
			enable = false,
		},
		smart_rename = {
			enable = true,
			disable = { "latex", "tex" },
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = false,
		},
	},
})

vim.cmd([[hi link @variable Variable]])
vim.cmd([[hi link @variable.builtin special]])
vim.cmd([[hi link @namespace Namespace]])
vim.cmd([[hi link @type.primitive Primitive]])
vim.cmd([[hi link @type.qualifier Primitive]])
vim.cmd([[hi link @type.qualifier Primitive]])
vim.cmd([[hi link @type.builtin Primitive]])
-- vim.cmd[[hi link @type.namespace Class]]

-- require('nvim-treesitter.highlight').set_custom_captures {
-- }
