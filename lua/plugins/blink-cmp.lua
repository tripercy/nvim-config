return {
    "saghen/blink.cmp",
    version = '1.*',

    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets"
    },

    config = function()
        require('blink.cmp').setup {
            keymap = {
                preset = 'default',
            },

            appearance = {
                nerd_font_variant = 'mono',
            },

            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 300 },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            snippets = { preset = 'luasnip' },
            fuzzy = { implementation = 'lua' },
            signature = { enabled = true },
        }
    end,
}
