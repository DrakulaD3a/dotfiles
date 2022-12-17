local remap = require 'drakula.keymap'
local nnoremap = remap.nnoremap
local tnoremap = remap.tnoremap


vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>")
nnoremap("<leader>e", "<cmd>Ex<CR>")

nnoremap("<leader>cp", "<cmd>CccPick<CR>")

nnoremap("<F5>", "<cmd>split term://bash<CR><C-w>J7<C-w>-i")

tnoremap("<F5>", "<C-\\><C-n><cmd>q<CR>")

nnoremap("<leader>sv", "<cmd>vertical split<CR>")
nnoremap("<leader>sh", "<cmd>vertical split<CR>")

nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
