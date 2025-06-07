return {
	"catppuccin/nvim",
	name = "catppuccin",
	dependencies = {
		"famiu/feline.nvim",
	},
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			-- transparent_background = true
		})
		vim.cmd.colorscheme("catppuccin")
		vim.cmd.hi("Comment gui=none")

		local ctp_feline = require("catppuccin.groups.integrations.feline")

		ctp_feline.setup()

		require("feline").setup({
			components = ctp_feline.get(),
		})
	end,
}
