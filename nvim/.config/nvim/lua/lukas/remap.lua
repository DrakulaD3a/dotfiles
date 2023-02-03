-- Just for the looks
local remap = vim.keymap.set

-- Open netrw
remap("n", "<leader>e", vim.cmd.Ex)

-- Open colorpicker
remap("n", "<leader>cp", vim.cmd.CccPick)

-- Open vertical/horizontal split pane
remap("n", "<leader>sv", "<cmd>vertical split<CR>")
remap("n", "<leader>sh", "<cmd>horizontal split<CR>")

-- Cursor always in the middle of the screen
remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")
