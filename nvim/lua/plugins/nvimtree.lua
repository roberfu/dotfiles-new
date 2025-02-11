return { -- tree toggle view
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 40,
                centralize_selection = true,
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
            },
        })
        vim.api.nvim_set_keymap(
            "n",
            "<leader>e",
            ":NvimTreeToggle<CR>",
            { desc = "[E]xtend Tree", noremap = true, silent = true }
        )
    end,
}
