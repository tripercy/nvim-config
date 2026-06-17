return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("fidget").setup()
        require("mason").setup()
        require('mason-tool-installer').setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "bashls",
            }
        })
        require("mason-lspconfig").setup()
    end,
}
