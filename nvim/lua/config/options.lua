-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.colorcolumn = "120"
if vim.g.vscode then
	opt.clipboard:append("unnamedplus")
	opt.colorcolumn = ""
end
