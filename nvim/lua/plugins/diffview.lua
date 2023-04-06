return {
	{
		"sindrets/diffview.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
		config = function()
			require("diffview").setup()
		end,
		keys = {
			{ "<leader>gd", ":DiffviewOpen<cr>", desc = "diff" },
		},
	},
}
