-- telescope
vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")


--tree map:

vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")


vim.keymap.set({"n", "v"}, "<leader>ì", ":CommentToggle<cr>")

-- toggle terminal
vim.keymap.set('n', '<C-\\>', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { noremap = true, silent = true })
-- Key mapping to close the floating terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><cmd>q<cr>', { noremap = true, silent = true })



-- code formatting
vim.keymap.set("n", "<leader>fmp", ":silent !black %<cr>")


--papis nvim:
-- Keymap to insert a citation in markdown or LaTeX
vim.keymap.set('n', '<leader>ci', '<cmd>PapisInsert<cr>', { noremap = true, silent = true })

-- Keymap to open a bibliography for review/editing
vim.keymap.set('n', '<leader>bl', '<cmd>PapisOpen<cr>', { noremap = true, silent = true })

-- markdown with papis as ref manager
vim.keymap.set("n", "<leader>pc", "<cmd>Telescope papis<cr>", {noremap=true, silent=true})


-- keymap to show todo list for coding
vim.keymap.set("n", "<leader>tt", "<cmd>TodoQuickFix<cr>")



vim.keymap.set("n", "<leader>qp", ":QuartoPreview<CR>", { desc = "Preview Quarto" })
vim.keymap.set("n", "<leader>qr", ":QuartoSend<CR>", { desc = "Run Quarto Chunk" })
vim.keymap.set("v", "<leader>qr", ":QuartoSend<CR>", { desc = "Run Selected Chunk" })

