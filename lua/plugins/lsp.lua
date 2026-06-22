local function get_lombok_jar_path()
    -- Configure jdtls BEFORE enabling it
    local mason_registry = require("mason-registry")
    local lombok_jar = ""

    -- Safely resolve the mason-managed lombok path
    if mason_registry.is_installed("jdtls") then
        local jdtls_pkg = mason_registry.get_package("jdtls")
        lombok_jar = jdtls_pkg:get_install_path() .. "/lombok.jar"
    end

    return lombok_jar
end

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

        -- Intercept and configure jdtls natively
        vim.lsp.config("jdtls", {
            cmd = {
                vim.fn.stdpath("data") .. "/mason/bin/jdtls",
                string.format("--jvm-arg=-javaagent:%s", get_lombok_jar_path()),
            },
            root_dir = function(bufnr, on_dir)
                on_dir(vim.fs.root(bufnr, { ".git", "pom.xml", "build.gradle", "build.gradle.kts" }))
            end,
        })

        require("mason-lspconfig").setup()
    end,
}
