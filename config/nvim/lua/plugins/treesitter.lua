return {
    "nvim-treesitter/nvim-treesitter",
	enabled = false,
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "bash" },
            auto_install = false,
            highlight = {
                enable = true,
            },
        })
    end,
}
