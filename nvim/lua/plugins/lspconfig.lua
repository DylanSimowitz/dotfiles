return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = { eslint = {} },
		diagnostics = {
			virtual_text = false,
		},
		setup = {
			eslint = function()
				require("lazyvim.util").on_attach(function(client)
					if client.name == "eslint" then
						client.server_capabilities.documentFormattingProvider = true
					elseif client.name == "tsserver" then
						client.server_capabilities.documentFormattingProvider = false
					end
				end)
			end,
		},
	},
}
