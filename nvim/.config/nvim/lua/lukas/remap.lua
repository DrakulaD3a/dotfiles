local remap = vim.keymap.set

remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")

remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")

remap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
