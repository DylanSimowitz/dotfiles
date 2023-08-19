return {
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
		keys = {
			{ "<leader>hw", "<cmd>HopWord<cr>", desc = "Hop Word" },
			{ "<leader>hl", "<cmd>HopLine<cr>", desc = "Hop Line" },
			{ "^M", "<cmd>HopWordMW<cr>", desc = "Hop Anywhere" },
		},
		vscode = true,
	},
}
