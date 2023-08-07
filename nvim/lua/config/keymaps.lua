-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
	vim.keymap.set("n", "<leader>gg", "<Cmd>call VSCodeNotify('workbench.action.tasks.runTask', 'close_lazygit')<CR>")
	vim.keymap.set("n", "<leader>", "<Cmd>call VSCodeNotify('whichkey.show')<CR>")
end
