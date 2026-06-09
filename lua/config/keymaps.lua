-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Paste without overwrite
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Move selected lines down (visual mode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })

-- Move selected lines up (visual mode)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- Clear highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Centered when jumping around
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = 'Telescope quickfix list' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Telescope search dir' })
local telescope_sd = require("config.funcs.telescope_sd")
vim.keymap.set('n', '<leader>sd', telescope_sd.search_dirs, { desc = 'Telescope search dir' })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
        vim.keymap.set("n", "gr", builtin.lsp_references, opts)
        vim.keymap.set("n", "gI", builtin.lsp_implementations, opts)
        vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

-- luasnip
local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-H>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-N>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-P>", function() ls.jump(-1) end, { silent = true })

-- Conform
-- keymaps for formatting
vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({
        async = true,
        lsp_fallback = true,
    })
end, { desc = "Format file or range" })
