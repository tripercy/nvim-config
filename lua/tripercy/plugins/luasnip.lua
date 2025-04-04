return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",

	dependencies = { "rafamadriz/friendly-snippets" },

	config = function()
		local ls = require("luasnip")

		vim.keymap.set({ "i" }, "<C-k>", function()
			ls.expand()
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			ls.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			ls.jump(-1)
		end, { silent = true })

		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
