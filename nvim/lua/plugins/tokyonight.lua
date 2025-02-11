return { -- colorscheme
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            light_style = "light",
            terminal_colors = true,
            day_brightness = 0.3,
            dim_inactive = false,
            lualine_bold = false,
            cache = true,
            plugins = {},
            style = "night",
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "dark",
            },
            on_colors = function() end,
            on_highlights = function() end,
        })
        vim.cmd([[colorscheme tokyonight]])
    end,
}
