local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

return {
	updater = {
		branch = "main",
	},
	colorscheme = "tokyonight-night",
	highlights = {
		init = {
			Normal = { bg = "NONE", ctermbg = "NONE" },
			NormalNC = { bg = "NONE", ctermbg = "NONE" },
			CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
			CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
			CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
			LineNr = {},
			SignColumn = {},
			StatusLine = {},
			NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
			NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
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
			{ "nvim-treesitter/nvim-treesitter-context", requires = { "nvim-treesitter/nvim-treesitter" } },
			{ "gaelph/logsitter.nvim", requires = { "nvim-treesitter/nvim-treesitter" } },
			{ "avneesh0612/react-nextjs-snippets" },
			{ "wakatime/vim-wakatime" },
			{ "lbrayner/vim-rzip" },
			{
				"zbirenbaum/copilot.lua",
				event = "VimEnter",
				config = function()
					vim.defer_fn(function()
						require("copilot").setup({
							suggestion = {
								enabled = true,
								auto_trigger = true,
								debounce = 75,
								keymap = {
									accept = "<M-l>",
									next = "<M-]>",
									prev = "<M-[>",
									dismiss = "<C-]>",
								},
							},
						})
						astronvim.add_user_cmp_source("copilot")
					end, 100)
				end,
			},
			{
				"zbirenbaum/copilot-cmp",
				after = { "copilot.lua" },
				config = function()
					require("copilot_cmp").setup({
						method = "getCompletionsCycling",
						formatters = {
							insert_text = require("copilot_cmp.format").remove_existing,
						},
					})
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
			ensure_installed = { "lua", "typescript", "tsx", "javascript", "css", "html", "prisma" },
		},
		cmp = function(opts)
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			-- modify the mapping part of the table
			cmp.event:on("menu_opened", function()
				vim.b.copilot_suggestion_hidden = true
			end)

			cmp.event:on("menu_closed", function()
				vim.b.copilot_suggestion_hidden = false
			end)
			opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
				if require("copilot.suggestion").is_visible() then
					require("copilot.suggestion").accept()
				elseif cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			})

			-- return the new table to be used
			return opts
		end,
		["mason-lspconfig"] = {
			ensure_installed = {
				"prismals",
				"jsonls",
				"sumneko_lua",
				"angularls",
				"tsserver",
				"pyright",
				"tailwindcss",
			},
		},
		["mason-nvim-dap"] = {
			ensure_installed = { "python", "js-debug-adapter", "node-debug2-adapter" },
		},
		["mason-tool-installer"] = {
			ensure_installed = { "prettierd", "stylua", "eslint_d", "vale" },
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
		vim.api.nvim_create_augroup("FormatOptions", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = "FormatOptions",
			pattern = "*",
			callback = function()
				vim.bo.formatoptions = vim.bo.formatoptions:gsub("c", "")
				vim.bo.formatoptions = vim.bo.formatoptions:gsub("r", "")
				vim.bo.formatoptions = vim.bo.formatoptions:gsub("o", "")
			end,
		})
	end,
}
