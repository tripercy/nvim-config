-- Enable faster startup by caching
vim.loader.enable()
vim.g.have_nerd_font = true

-- Clipboard
-- vim.g.clipboard = {
--     name = "wl-clipboard",
--     copy = {
--         ["+"] = "wl-copy",
--         ["*"] = "wl-copy",
--     },
--     paste = {
--         ["+"] = "wl-paste",
--         ["*"] = "wl-paste",
--     },
--     cache_enabled = 0,
-- }

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Keep 8 lines above/below cursor
vim.opt.scrolloff = 8

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Persistance undo
vim.opt.undofile = true

-- Highlight cursorline
vim.opt.cursorline = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Theme
vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin-frappe")
vim.opt.showmode = false

-- Always show signcolumn
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Pop up border
vim.opt.winborder = "rounded"
