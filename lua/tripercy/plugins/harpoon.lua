return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end)

        vim.keymap.set("n", "<leader>hh", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<leader>h1", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader>h2", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader>h3", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader>h4", function()
            harpoon:list():select(4)
        end)
        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hj", function()
            harpoon:list():prev()
        end)

        vim.keymap.set("n", "<C-S-N>hk", function()
            harpoon:list():next()
        end)
    end,
}
