return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("which-key").setup({
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			window = {
				border = "single",
				position = "bottom",
			},
			ignore_missing = true,
		})
	end,
}
