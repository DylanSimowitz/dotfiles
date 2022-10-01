return {
	updater = {
		branch = "nightly",
	},
	colorscheme = "tokyonight-night",
	options = {
		g = {
			tokyonight_style = "night",
		},
	},
	header = {
		"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
		"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
		"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
		"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
		"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
		"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
		"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
		" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
		" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
		"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
		"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
	},
	mappings = {
		t = {
			["<c-q>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
			["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
		},
	},
	["which-key"] = {
		register = {
			n = {
				["<leader>"] = {
					d = {
						name = "Debug",
						c = { ":lua require'dap'.continue()<CR>", "Continue" },
						o = { ":lua require'dap'.step_over()<CR>", "Step Over" },
						i = { ":lua require'dap'.step_into()<CR>", "Step Into" },
						O = { ":lua require'dap'.step_out()<CR>", "Step Out" },
						b = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
						B = {
							":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
							"Conditional Breakpoint",
						},
						-- = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"}
						r = { ":lua require'dap'.repl.open()<CR>", "REPL" },
						-- = { ":lua require'dap'.run_last()<CR>"}
						-- = { ":lua require'dap'.run_last()<CR>"}
					},
					h = {
						name = "Hop",
						c = { "<cmd>HopChar1<cr>", "Character" },
						C = { "<cmd>HopChar2<cr>", "2 Characters" },
						l = { "<cmd>HopLine<cr>", "Line" },
						p = { "<cmd>HopPattern<cr>", "Pattern" },
						w = { "<cmd>HopWord<cr>", "Word" },
					},
				},
			},
		},
	},
	plugins = {
		init = {
			{ "nvim-treesitter/nvim-treesitter-context", requires = "nvim-treesitter/nvim-treesitter" },
			{ "mfussenegger/nvim-dap" },
			{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
			{ "theHamsta/nvim-dap-virtual-text" },
			{ "gaelph/logsitter.nvim", requires = { "nvim-treesitter/nvim-treesitter" } },
			{ "avneesh0612/react-nextjs-snippets" },
			{ "wakatime/vim-wakatime" },
			{ "lbrayner/vim-rzip" },
			{
				"zbirenbaum/copilot.lua",
				after = "heirline.nvim",
				config = function()
					vim.defer_fn(function()
						astronvim.add_user_cmp_source("copilot")
						require("copilot").setup()
					end, 100)
				end,
			},
			{
				"zbirenbaum/copilot-cmp",
				after = { "copilot.lua" },
				config = function()
					require("copilot_cmp").setup()
				end,
			},
			{ "folke/tokyonight.nvim" },
			{
				"phaazon/hop.nvim",
				branch = "v2",
				config = function()
					require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
				end,
			},
			{
				"beauwilliams/focus.nvim",
				config = function()
					require("focus").setup({
						-- treewidth = 40,
					})
				end,
			},
		},
		["null-ls"] = function(config)
			local null_ls = require("null-ls")
			local vale = null_ls.builtins.diagnostics.vale
			vale["filetypes"] = { "markdown", "tex", "asciidoc", "html" }
			config.sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.stylua,
				vale,
			}
			return config
		end,
		treesitter = {
			ensure_installed = { "lua" },
		},
		["mason-lspconfig"] = {
			ensure_installed = { "sumneko_lua" },
		},
		["mason-tool-installer"] = {
			ensure_installed = { "prettier", "stylua" },
		},
		lspkind = {
			symbol_map = {
				Copilot = "",
			},
		},
		packer = {
			compile_path = vim.fn.stdpath("data") .. "/packer_compiled.lua",
		},
	},
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			copilot = 800,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},
	lsp = {
		formatting = {
			timeout_ms = 3200,
			disabled = { "sumneko_lua", "tsserver" },
			filter = function(client)
				if vim.bo.filetype == "javascript" then
					return client.name == "null-ls"
				end
				return true
			end,
		},
		["server-settings"] = {
			clangd = {
				capabilities = { offsetEncoding = "utf-8" },
			},
			sqls = {
				cmd = { "sqls", "--config", vim.loop.cwd() .. "/.sqls/config.yml" },
			},
			yamlls = {
				settings = {
					yaml = {
						schemas = {
							["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
							["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						},
					},
				},
			},
		},
	},
	diagnostics = {
		virtual_text = true,
		underline = true,
	},
	polish = function()
		vim.api.nvim_create_augroup("Logsitter", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = "Logsitter",
			pattern = "javascript,go,lua,javascriptreact,javascript.jsx,typescript,typescriptreact,typescript.tsx",
			callback = function()
				vim.keymap.set("n", "<leader>lg", function()
					require("logsitter").log()
				end)
			end,
		})
	end,
}
