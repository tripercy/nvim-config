return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre", -- Load when you start reading a buffer
    opts = {
        -- Basic configuration
        signs = {
            add          = { text = "┃" },
            change       = { text = "┃" },
            delete       = { text = "_" },
            topdelete    = { text = "‾" },
            changedelete = { text = "~" },
            untracked    = { text = "┆" },
        },
        current_line_blame = false, -- Toggle this for inline blame
    },
}
