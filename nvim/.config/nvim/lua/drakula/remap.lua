local remap = vim.keymap.set


remap("n", "<leader>e", "<cmd>Ex<CR>")

remap("n", "<leader>cp", "<cmd>CccPick<CR>")

remap("n", "<F5>", "<cmd>split<CR><cmd>term<CR><C-w>J7<C-w>-i")

remap("t", "<F5>", "<C-\\><C-n>:q<CR>")

remap("n", "<leader>sv", "<cmd>vertical split<CR>")
remap("n", "<leader>sh", "<cmd>vertical split<CR>")

remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")
