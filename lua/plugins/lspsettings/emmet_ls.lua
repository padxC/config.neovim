return {
	setting = {
		filetypes = {
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			--"typescriptreact",
		},
		-- read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
		-- **note:** only the options listed in the table are supported.
		init_options = {
			---@type table<string, string>
			includelanguages = {},
			--- @type string[]
			excludelanguages = {},
			--- @type string[]
			extensionspath = {},
			--- @type table<string, any> [emmet docs](https://docs.emmet.io/customization/preferences/)
			preferences = {},
			--- @type boolean defaults to `true`
			showabbreviationsuggestions = true,
			--- @type "always" | "never" defaults to `"always"`
			showexpandedabbreviation = "always",
			--- @type boolean defaults to `false`
			showsuggestionsassnippets = false,
			--- @type table<string, any> [emmet docs](https://docs.emmet.io/customization/syntax-profiles/)
			syntaxprofiles = {},
			--- @type table<string, string> [emmet docs](https://docs.emmet.io/customization/snippets/#variables)
			variables = {},
		},
	},
}
