local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},
}

function M.config()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local opts = { buffer = ev.buf, silent = true }

			-- keymaps
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			vim.keymap.set({ "n", "v" }, "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts) -- see available code actions, in visual mode will apply to selection

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
			vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", opts) -- [s]how  diagnostics
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
		end,
	})

	local border = {
		"╔",
		"═",
		"♚",
		"║",
		"╝",
		"═",
		"╚",
		"║",
	}

	local signs = {
		[vim.diagnostic.severity.ERROR] = " ",
		[vim.diagnostic.severity.WARN] = " ",
		[vim.diagnostic.severity.HINT] = "󰠠 ",
		[vim.diagnostic.severity.INFO] = " ",
	}

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
	require("lspconfig.ui.windows").default_options = {
		border = border,
	}

	-- Set the diagnostic config with all icons
	vim.diagnostic.config({
		signs = {
			text = signs, -- Enable signs in the gutter
		},
		virtual_text = true, -- Specify Enable virtual text for diagnostics
		underline = true, -- Specify Underline diagnostics
		update_in_insert = false, -- Keep diagnostics active in insert mode
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			header = " ☘︎ Diagnostic ☘︎ ",
			prefix = "",
		},
	})

	-- Setup servers
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- Config lsp servers here
	lspconfig.lua_ls.setup({ -- lua_ls
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				completion = {
					callSnippet = "Replace",
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	lspconfig.emmet_ls.setup({ -- emmet_ls
		capabilities = capabilities,
		filetypes = {
			"html",
			"typescriptreact",
			"javascriptreact",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
		},
	})

	lspconfig.emmet_language_server.setup({ -- emmet_language_server
		capabilities = capabilities,
		filetypes = {
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"pug",
			"typescriptreact",
		},
		init_options = {
			includeLanguages = {},
			excludeLanguages = {},
			extensionsPath = {},
			preferences = {},
			showAbbreviationSuggestions = true,
			showExpandedAbbreviation = "always",
			showSuggestionsAsSnippets = false,
			syntaxProfiles = {},
			variables = {},
		},
	})

	lspconfig.denols.setup({ -- denols
		capabilities = capabilities,
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	})

	lspconfig.ts_ls.setup({ -- ts_ls (replaces tsserver)
		capabilities = capabilities,
		root_dir = function(fname)
			local util = lspconfig.util
			return not util.root_pattern("deno.json", "deno.jsonc")(fname)
				and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
		end,
		single_file_support = false,
		init_options = {
			preferences = {
				includeCompletionsWithSnippetText = true,
				includeCompletionsForImportStatements = true,
			},
		},
	})
end

return M
