-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

vim.api.nvim_set_option("guifont", "JetbrainsMono Nerd Font:h14")

hooks.add("setup_mappings", function(map)
   map("n", "<leader>fm", "<buffer> lua vim.lsp.buf.formatting_seq_sync()")
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
   use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
       require("custom.plugins.null-ls").setup()
    end,
   }
   use {
     "ekickx/clipboard-image.nvim",
     config = function()
       require("custom.plugins.clipboard-image").setup()
     end,
   }
   use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
   }
   use({
     'jameshiew/nvim-magic',
     config = function()
       require('nvim-magic').setup()
     end,
     requires = {
       'nvim-lua/plenary.nvim',
       'MunifTanjim/nui.nvim'
     }
   })
  use ({
    'TimUntersberger/neogit',
    config = function()
      require("custom.plugins.neogit").setup()
    end,
    requires = {
      -- 'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    }
  })
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
require "custom.autocmds"

