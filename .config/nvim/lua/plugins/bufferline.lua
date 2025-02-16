return { -- tab page integration
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                themable = true,
            },
        })
        vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
    end,
}
