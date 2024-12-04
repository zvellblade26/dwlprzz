return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	event = "VeryLazy",
	config = function()
		require("lualine").setup ({
			options = {
				--theme = "auto"
				--theme = "horizon"
				--theme = "fluoromachine" -- Enable Fluromachine ColorScheme
				--theme = "dracula"
				--theme = "gruvbox_dark"
				--theme = "gruvbox_light"
				--theme = "solarized_dark"
				theme = "16color"
			},
		})
	end
}
