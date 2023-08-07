return {
	{
		"andrewferrier/debugprint.nvim",
		config = function()
			require("debugprint").setup({
				create_keymaps = false,
			})
		end,
		keys = {
			{
				"<leader>dp",
				function()
					return require("debugprint").debugprint({ variable = true })
				end,
				desc = "Debug Print",
				expr = true,
			},
		},
		vscode = true,
	},
}
