return {
	"ellisonleao/gruvbox.nvim",
	enabled = true,
	lazy = true,
	-- priority = 1000,
	config = function ()
		require("gruvbox").setup({
			transparent_mode = false,
			contrast = "hard",
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true,
			dim_inactive = false,
			overrides = {
				Constant = {link="GruvboxPurpleBold"},
				StorageClass = {fg = "#98A254", bold=true},
				Type = {link="GruvboxYellowBold"},
				Identifier = {link="GruvboxBlue"},
				["@parameter"] = {link = "GruvboxYellow"},
				["@variable.builtin"] = {link="GruvboxYellowBold"},
				["@text.uri"] = {},
				htmlArg = {link="GruvboxRed"},
				Conditional = { link = "GruvboxRedBold" },
				Statement = { link = "GruvboxRedBold" },
				Repeat = { link = "GruvboxRedBold" },
					Label = { link = "GruvboxRedBold" },
					Keyword = { link = "GruvboxRedBold" },
					Tag = { link = "GruvboxRedBold" },
					Special = { link = "GruvboxOrangeBold" },
				}
			})
		end
	}
