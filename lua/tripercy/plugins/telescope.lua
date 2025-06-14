return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { -- If encountering errors, see telescope-fzf-native README for installation instructions
            "nvim-telescope/telescope-fzf-native.nvim",

            -- `build` is used to run some command when the plugin is installed/updated.
            -- This is only run then, not every time Neovim starts up.
            build = "make",

            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },

        -- Useful for getting pretty icons, but requires a Nerd Font.
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font
        },
    },

    config = function()
        local builtin = require("telescope.builtin")
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
        require('telescope').load_extension('bookmarks')
        vim.keymap.set("n", "<leader>sf", function() builtin.find_files({ hidden = false }) end, {})
        vim.keymap.set("n", "<leader>sa", function() builtin.find_files({ no_ignore = true, hidden = true }) end, {})
        vim.keymap.set("n", "<leader>sd", function() builtin.fd({ find_command = { "fd", "-t=d" } }) end, {})
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>sm", require('telescope').extensions.bookmarks.list, {})
        vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
    end,
}
