return {
    "stevearc/conform.nvim",
    event = "VeryLazy",

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            json = { "prettier" },
            bash = { "shfmt" },
        },

        -- don't auto format
        format_on_save = nil,
    },
}
