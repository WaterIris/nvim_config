vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste dont update clipboard" })
vim.keymap.set("x", "<leader>d", "\"_d", { desc = "Delete dont update clipboard" })
