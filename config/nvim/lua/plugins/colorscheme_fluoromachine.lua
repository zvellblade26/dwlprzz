return {
	"maxmx03/fluoromachine.nvim",
	enabled = true,
	lazy = true,
	-- priority = 1000,
	config = function ()
		local fm = require "fluoromachine"

		fm.setup {
			glow = false,
			theme = "fluoromachine",
			transparent = false,
			brightness = 0.065,
			colors = function(_, d)
				return {
					fg = "#00a0ff",
					bg = "#00131a",
					--alt_bg = d("#00131a", 20),
					cyan = "#00ffff",
					red = "#ff0000",
					yellow = "#fbff00",
					pink = "#ff0080",
					green = "#00ff6a",
					orange = "#ff7f00"
				}
			end,
			overrides = {
				['@type'] = { italic = true, bold = false },
				['@function'] = { italic = false, bold = false },
				['@comment'] = { italic = true },
				['@keyword'] = { italic = false },
				['@constant'] = { italic = false, bold = false },
				['@variable'] = { italic = true },
				['@field'] = { italic = true },
				['@parameter'] = { italic = true },
			}
		}

	end
}
