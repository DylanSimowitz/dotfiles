local M = {}
M.setup = function(on_attach)
  require'neogit'.setup {
    integrations = {
      diffview = true
    },
  }
end

return M
