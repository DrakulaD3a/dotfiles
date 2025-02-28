local remap = vim.keymap.set

remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")

remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")

remap("n", "g[", function()
    vim.diagnostic.jump({ count = -1, float = true })
end, { silent = true, noremap = true })
remap("n", "g]", function()
    vim.diagnostic.jump({ count = 1, float = true })
end, { silent = true, noremap = true })
remap("n", "gl", vim.diagnostic.open_float, { silent = true, noremap = true })
