return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("fidget").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "pyright",
                "bashls",
                "java_language_server",
            },

            handlers = {
                function(server)
                    require("lspconfig")[server].setup({
                        capabilities = require("cmp_nvim_lsp").require('blink.cmp').get_lsp_capabilities(server.config
                        .capabilities),
                    })
                end,

                -- example: custom config for lua
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = require("blink.cmp").default_capabilities(),
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,
            },
        })
    end,
}
