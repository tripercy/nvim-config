return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons

    config = function()
        local oil = require("oil")
        oil.setup({
            columns = {
                "icon",
            },
        })
        vim.keymap.set('n', '<leader>o', '<cmd>Oil<Cr>')
    end
}
