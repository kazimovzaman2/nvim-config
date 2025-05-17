-- Map <leader>e to open the file explorer (:Ex command) silently in normal mode
vim.keymap.set("n", "<leader>e", function() vim.cmd.Ex() end, { silent = true })


-- Remap 'y' in normal mode to yank text into the system clipboard
vim.keymap.set("n", "y", '"+y', { noremap = true, silent = true })
-- Remap 'y' in visual mode to yank selected text into the system clipboard
vim.keymap.set("v", "y", '"+y', { noremap = true, silent = true })


-- Map <leader>p in normal and visual modes to paste from the system clipboard silently
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true })


-- Map <leader>w in normal mode to save the current file silently
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
-- Map <leader>q in normal mode to quit the current window silently
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })


-- Open a terminal in a vertical split on the right side
vim.keymap.set("n", "<leader>t", ":rightbelow vsplit | terminal<CR>", { silent = true })
-- In terminal mode, press Esc to switch to normal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
-- In normal mode, pressing <leader>ww switches to the next window (split)
vim.keymap.set('n', '<leader>ww', '<C-w>w', { noremap = true, silent = true })
