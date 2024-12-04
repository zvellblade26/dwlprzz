return {
	"tiagovla/tokyodark.nvim",
	enabled = true,
	lazy = true,
	-- priority = 1000,
	config = function()
		require("tokyodark").setup({
			transparent_background = false,
			terminal_colors = true,
			gamma = 1.00,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				identifiers = { italic = true },
				functions = {},
				variables = {},
			},
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = "#ff0000"
			end,
		})
	end,
}
