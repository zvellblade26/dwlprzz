return {
	"marko-cerovac/material.nvim",
	enabled = true,
	lazy = true,
	-- priority = 1000,
	config = function()
		--vim.g.material_style = "deep ocean"
		--vim.g.material_style = "darker"
		--vim.g.material_style = "lighter"
		vim.g.material_style = "pale night"
		--vim.g.material_style = "oceanic"
		local fm = require("material")
		fm.setup({
			lualine_style = "default",
		})
	end,
}
