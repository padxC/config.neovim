local M = {
	--go to see https://github.com/echasnovski/mini.nvim
	"echasnovski/mini.nvim",
}

function M.config()
	-- color highlight plugins inside neovim
	local hipatterns = require("mini.hipatterns")

	-- Returns hex color group for matching hsl() color.
	---@param match string
	---@return string
	local hsl_color = function(_, match)
		local style = "bg" -- 'fg' or 'bg'
		local hue, saturation, lightness = match:match("hsl%((%d+), ?(%d+)%%, ?(%d+)%%%)")

		-- Converts HSL to RGB.
		-- https://www.w3.org/TR/css-color-3/#hsl-color
		---@param h string The hue value in degrees.
		---@param s string The saturation value in percent.
		---@param l string The lightness value in percent.
		---@return integer, integer, integer
		local function hsl_to_rgb(h, s, l)
			h, s, l = h % 360, s / 100, l / 100
			if h < 0 then
				h = h + 360
			end
			local function f(n)
				local k = (n + h / 30) % 12
				local a = s * math.min(l, 1 - l)
				return l - a * math.max(-1, math.min(k - 3, 9 - k, 1))
			end
			return f(0) * 255, f(8) * 255, f(4) * 255
		end

		local red, green, blue = hsl_to_rgb(tonumber(hue), tonumber(saturation), tonumber(lightness))
		local hex = string.format("#%02x%02x%02x", red, green, blue)
		return hipatterns.compute_hex_color_group(hex, style)
	end

	hipatterns.setup({
		tailwind = {
			enabled = true,
			ft = {
				"astro",
				"css",
				"heex",
				"html",
				"html-eex",
				"javascript",
				"javascriptreact",
				"rust",
				"svelte",
				"typescript",
				"typescriptreact",
				"vue",
			},
			-- full: the whole css class will be highlighted
			-- compact: only the color will be highlighted
			style = "full",
		},
		highlighters = {
			-- hex_color
			hex_color = hipatterns.gen_highlighter.hex_color({ priority = 2000 }),

			-- hsl_color
			hsl_color = {
				pattern = "hsl%(%d+, ?%d+%%, ?%d+%%%)",
				group = hsl_color,
			},

			-- shorthand hex color
			shorthand = {
				pattern = "()#%x%x%x()%f[^%x%w]",
				group = function(_, _, data)
					---@type string
					local match = data.full_match
					local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
					local hex_color = "#" .. r .. r .. g .. g .. b .. b

					return hipatterns.compute_hex_color_group(hex_color, "bg")
				end,
				extmark_opts = { priority = 2000 },
			},
		},
	})
end

return M
