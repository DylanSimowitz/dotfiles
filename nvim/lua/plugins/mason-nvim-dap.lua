return {
	"jay-babu/mason-nvim-dap.nvim",
	version = "2.0.0",
	opts = {
		-- Makes a best effort to setup the various debuggers with
		-- reasonable debug configurations
		automatic_setup = true,

		-- You can provide additional configuration to the handlers,
		-- see mason-nvim-dap README for more information
		handlers = {},

		-- You'll need to check that you have the required things installed
		-- online, please don't ask me how to install them :)
		ensure_installed = {
			"js",
		},
	},
}
