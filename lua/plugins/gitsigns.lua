return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre", -- Load when you start reading a buffer
    opts = {
        -- Basic configuration
        signs = {
            add = { text = '+' }, ---@diagnostic disable-line: missing-fields
            change = { text = '~' }, ---@diagnostic disable-line: missing-fields
            delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
            topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
            changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
        },
        current_line_blame = false, -- Toggle this for inline blame
    },
}
