return {
	"jackMort/ChatGPT.nvim",
	config = function()
		require("chatgpt").setup({
			keymaps = {
				submit = "<CR>",
			},
		})
	end,
	requires = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
