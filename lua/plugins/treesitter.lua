return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },

    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    opts = {
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "javascript",
            "typescript",
            "python",
            "bash",
            "json",
            "html",
            "css",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                scope_incremental = "<S-CR>",
                node_decremental = "<BS>",
            },
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
        },
    },
}
