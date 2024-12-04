return {
	"craftzdog/solarized-osaka.nvim",
	enabled = true,
	lazy = true,
	-- priority = 1000,
	opts = {},
	config = function ()
		require("solarized-osaka").setup({
			transparent = false,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
			sidebars = { "qf", "help" },
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = false,
			lualine_bold = false,

			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = "#ff0000"
			end,

			on_highlights = function(highlights, colors)
			end,
		})
	end
}
