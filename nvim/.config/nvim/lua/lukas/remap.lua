-- Just for the looks
local remap = vim.keymap.set

-- Cursor always in the middle of the screen
remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")

remap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
remap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
