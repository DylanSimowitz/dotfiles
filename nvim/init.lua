return {
	colorscheme = "tokyonight",
	options = {
		g = {
			tokyonight_style = "night",
			copilot_no_tab_map = true,
		},
		opt = {
			cmdheight = 1,
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
			["<esc>"] = false,
			["jk"] = false,
			["<c-q>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
			["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
		},
	},
	["which-key"] = {
		register_mappings = {
			n = {
				["<leader>"] = {
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
			{
				"zbirenbaum/copilot.lua",
				after = "feline.nvim",
				config = function()
					vim.defer_fn(function()
						require("copilot").setup()
					end, 100)
				end,
			},
			{ "zbirenbaum/copilot-cmp", after = "copilot.lua" },
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
						treewidth = 40,
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
			config.on_attach = function(client)
				if client.resolved_capabilities.document_formatting then
					vim.api.nvim_create_autocmd("BufWritePre", {
						desc = "Auto format before save",
						pattern = "<buffer>",
						callback = vim.lsp.buf.formatting_sync,
					})
				end
			end
			return config
		end,
	},
	lsp = {
		["server-settings"] = {
			tsserver = {
				on_attach = function(client)
					client.resolved_capabilities.document_formatting = false
				end,
			},
			sumneko_lua = {
				cmd = { "lua-language-server", "--preview" },
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},

						diagnostics = {
							globals = { "vim" },
						},
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
							},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
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
}
