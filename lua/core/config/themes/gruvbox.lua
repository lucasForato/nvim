return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	opts = {},
	config = function()
		require("gruvbox").setup({
			transparent_mode = true,
		})

		vim.o.background = "dark"
	end,
}
