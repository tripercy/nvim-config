return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                section_separators = "",
                component_separators = "",
            },

            extensions = {
                "oil",
                "quickfix",
            },

            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },

                lualine_x = { "lsp_status", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
