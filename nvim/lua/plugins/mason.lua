return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				-- add tsx and treesitter
				ensure_installed = {
					"angular-language-server",
					"css-lsp",
					"eslint-lsp",
					"eslint_d",
					"html-lsp",
					"json-lsp",
					"lua-language-server",
					"prettierd",
					"prisma-language-server",
					"tailwindcss-language-server",
					"typescript-language-server",
				},
			})
		end,
	},
}
