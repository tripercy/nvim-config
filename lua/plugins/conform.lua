return {
	"stevearc/conform.nvim",
	event = "VeryLazy",

	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "jq" },
			bash = { "shfmt" },
			tex = { "tex-fmt" },
			yaml = { "prettier" },
		},

		-- don't auto format
		format_on_save = nil,
	},
}
