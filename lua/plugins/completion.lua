local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
		{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
		{ "hrsh7th/cmp-path", event = "InsertEnter" },
		{ "hrsh7th/cmp-cmdline", event = "InsertEnter" },
		-----[[

		{ "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
		{ "onsails/lspkind.nvim", event = "InsertEnter" },

		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			event = "InsertEnter",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		{
			"windwp/nvim-autopairs",
			event = { "InsertEnter" },
		},
	},
}

function M.config()
	require("lspkind").init({})
	require("nvim-autopairs").setup({
		disable_filetype = { "TelescopePrompt", "vim" },
		check_ts = true, -- enable treesitter
		ts_config = {
			lua = { "string" }, -- don't add pairs in lua string treesitter nodes
			javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
			java = false,
		},
	})
	-- configure autopairs

	-- import nvim-autopairs completion functionality
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	-- import nvim-cmp plugin (completions plugin)
	local cmp = require("cmp")
	-- make autopairs and completion work together
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	local border = {
		border = {
			"╔",
			"═",
			"♚",
			"║",
			"╝",
			"═",
			"╚",
			"║",
		},
	}
	--☘

	cmp.setup({
		--]]
		snippet = { -- for lua users
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(border),
			documentation = cmp.config.window.bordered(border),
		},
		--]]
		mapping = {
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-y>"] = cmp.mapping( -- yess
				cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				{ "i", "c" }
			),
		},
		sources = cmp.config.sources({
			{ name = "luasnip" }, -- for luasnip users.
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
		}),

		experimental = { -- show ghost_text in completion
			ghost_text = false,
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	local luasnip = require("luasnip")
	luasnip.config.set_config({
		history = false,
		updateevents = "TextChanged,TextChangedI",
	})
end

return M
