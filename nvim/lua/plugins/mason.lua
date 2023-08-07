return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				-- add tsx and treesitter
				ensure_installed = {
					"angular-language-server",
					"css-lsp",
					"emmet-ls",
					"eslint-lsp",
					"flake8",
					"html-lsp",
					"js-debug-adapter",
					"json-lsp",
					"lua-language-server",
					"prettierd",
					"shellcheck",
					"shfmt",
					"stylua",
					"tailwindcss-language-server",
					"typescript-language-server",
				},
			})
		end,
	},
}
