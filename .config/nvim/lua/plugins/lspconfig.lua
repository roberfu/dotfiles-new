return { -- language server protocol config
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local servers = { -- add servers to ensure install and add some config
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
        }
        require("mason").setup()
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, { -- add servers to ensure install without config
            "stylua",
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_installation = true,
        })
    end,
}
