return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = true,
	event = "VeryLazy",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
	-- MULTIPLE INDENT COLOR
	--config = function ()
	--	local highlight = {
	--		"Rainbow1",
	--		"Rainbow2",
	--		"Rainbow3",
	--		"Rainbow4",
	--		"Rainbow5",
	--		"RainbowGreen",
	--		"RainbowRed",
	--		"RainbowViolet",
	--		"RainbowOrange",
	--		"RainbowYellow",
	--		"RainbowCyan",
	--		"RainbowBlue",
	--	}

	--	local hooks = require "ibl.hooks"
	--	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	--		vim.api.nvim_set_hl(0, "Rainbow1", { fg = "#a300ff" })
	--		vim.api.nvim_set_hl(0, "Rainbow2", { fg = "#6f00ff" })
	--		vim.api.nvim_set_hl(0, "Rainbow3", { fg = "#5600ff" })
	--		vim.api.nvim_set_hl(0, "Rainbow4", { fg = "#0078ff" })
	--		vim.api.nvim_set_hl(0, "Rainbow5", { fg = "#009fff" })
	--		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	--		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	--		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#00ff18" })
	--		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ff0000" })
	--		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	--		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	--		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	--	end)

	--	require("ibl").setup { indent = { highlight = highlight } }
	--end,
}
