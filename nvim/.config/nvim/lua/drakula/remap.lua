local remap = require 'drakula.keymap'
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap
local tnoremap = remap.tnoremap

vim.g.mapleader = " "

nnoremap("<leader>e", "<cmd>Ex<CR>")

nnoremap("<leader>cp", "<cmd>CccPick<CR>")

nnoremap("<F5>", "<cmd>split term://bash<CR><C-w>J7<C-w>-i")
inoremap("<F5>", "<Esc><cmd>split term://bash<CR><C-w>J7<C-w>-i")
vnoremap("<F5>", "<Esc><cmd>split term://bash<CR><C-w>J7<C-w>-i")

tnoremap("<F5>", "<C-\\><C-n><cmd>q<CR>")

nnoremap("<leader>html", "<cmd>-1read ~/.config/nvim/templates/html<CR>5j3wa")

nnoremap("<leader>sv", "<cmd>vertical split<CR>")
nnoremap("<leader>sh", "<cmd>vertical split<CR>")
