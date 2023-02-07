return {
  {
    "andrewferrier/debugprint.nvim",
    config = function()
      require("debugprint").setup({
        create_keymaps = false,
      })
    end,
    keys = {
      {
        "<leader>pd",
        function()
          require("debugprint").debugprint({ variable = true })
        end,
        desc = "Debug Print",
      },
      {
        "<leader>px",
        function()
          require("debugprint").deleteprints()
        end,
        desc = "Delete Debug Prints",
      },
    },
  },
}
