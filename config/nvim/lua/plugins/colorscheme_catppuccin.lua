return {
	"catppuccin/nvim",
	enabled = true,
	lazy = true,
	-- priority = 1000,
	config = function ()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			})
		end
	}
