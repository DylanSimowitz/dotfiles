return {
	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "nightly", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},

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
					g = {
						name = "+Git",
						h = {
							name = "+Github",
							c = {
								name = "+Commits",
								c = { "<cmd>GHCloseCommit<cr>", "Close" },
								e = { "<cmd>GHExpandCommit<cr>", "Expand" },
								o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
								p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
								z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
							},
							i = {
								name = "+Issues",
								p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
							},
							l = {
								name = "+Litee",
								t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
							},
							r = {
								name = "+Review",
								b = { "<cmd>GHStartReview<cr>", "Begin" },
								c = { "<cmd>GHCloseReview<cr>", "Close" },
								d = { "<cmd>GHDeleteReview<cr>", "Delete" },
								e = { "<cmd>GHExpandReview<cr>", "Expand" },
								s = { "<cmd>GHSubmitReview<cr>", "Submit" },
								z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
							},
							p = {
								name = "+Pull Request",
								c = { "<cmd>GHClosePR<cr>", "Close" },
								d = { "<cmd>GHPRDetails<cr>", "Details" },
								e = { "<cmd>GHExpandPR<cr>", "Expand" },
								o = { "<cmd>GHOpenPR<cr>", "Open" },
								p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
								r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
								t = { "<cmd>GHOpenToPR<cr>", "Open To" },
								z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
							},
							t = {
								name = "+Threads",
								c = { "<cmd>GHCreateThread<cr>", "Create" },
								n = { "<cmd>GHNextThread<cr>", "Next" },
								t = { "<cmd>GHToggleThread<cr>", "Toggle" },
							},
						},
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
			{ "gaelph/logsitter.nvim", requires = { "nvim-treesitter/nvim-treesitter" } },
			{
				"avneesh0612/react-nextjs-snippets",
			},
			{
				"wakatime/vim-wakatime",
			},
			{
				"lbrayner/vim-rzip",
			},
			{
				"ldelossa/gh.nvim",
				requires = { { "ldelossa/litee.nvim" } },
				config = function()
					require("litee.lib").setup()
					require("litee.gh").setup()
				end,
			},
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
		treesitter = {
			ensure_installed = { "lua" },
		},
		-- use mason-lspconfig to configure LSP installations
		["mason-lspconfig"] = {
			ensure_installed = { "sumneko_lua" },
		},
		-- use mason-tool-installer to configure DAP/Formatters/Linter installation
		["mason-tool-installer"] = {
			ensure_installed = { "prettier", "stylua" },
		},
		packer = {
			compile_path = vim.fn.stdpath("data") .. "/packer_compiled.lua",
		},
	},
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
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
