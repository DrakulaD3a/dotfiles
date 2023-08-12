-- Just for the looks
local remap = vim.keymap.set

-- Cursor always in the middle of the screen
remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")

-- Remap for moving selected text
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")

-- Remap for dealing with quickfix list
remap("n", "<C-e>", vim.cmd.cprevious, { silent = true })
remap("n", "<C-c>", vim.cmd.cnext, { silent = true })

-- Tmux-sessionizer remap
remap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- I don't even use this
remap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
