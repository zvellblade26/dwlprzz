return {
	"scottmckendry/cyberdream.nvim",
	enabled = true,
	lazy = true,
	-- priority = 1000,
	config = function()
		local cy = require "cyberdream"
		cy.setup({
			theme = { variant = "default" }
		})
	end,
}
