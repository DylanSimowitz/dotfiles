-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
	vim.keymap.set("n", "<leader>gg", "<Cmd>call VSCodeNotify('workbench.action.tasks.runTask', 'close_lazygit')<CR>")
	-- vim.keymap.set("n", "<leader>", "<Cmd>call VSCodeNotify('whichkey.show')<CR>")
	vim.keymap.set("n", "<leader>e", "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>")
	vim.keymap.set("n", "<leader>/", "<Cmd>call VSCodeNotify('find-it-faster.findWithinFiles')<CR>")
	vim.keymap.set("n", "<leader>ff", "<Cmd>call VSCodeNotify('find-it-faster.findFiles')<CR>")
end
