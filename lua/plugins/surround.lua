local M = {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
}

function M.config()
	require("nvim-surround").setup({})
	--  The Key Commands -> for help run :h nvim-surround.usage
	--
	--     Old text                    Command         New text
	-- --------------------------------------------------------------------------------
	--     surr*ound_words             ysiw)           (surround_words)
	--     *make strings               ys$"            "make strings"
	--     [delete ar*ound me!]        ds]             delete around me!
	--     remove <b>HTML t*ags</b>    dst             remove HTML tags
	--     'change quot*es'            cs'"            "change quotes"
	--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
	--     delete(functi*on calls)     dsf             function calls
	--
end

return M
