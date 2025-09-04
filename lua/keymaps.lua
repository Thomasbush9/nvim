vim.g.mapleader = " "

--- keymap for bufferline next, previous, delet

vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
--- keymap to yank to clipboard

-- Move line(s) up/down in normal and visual modes

