------------------------------------------------
--------------------- OPTS ---------------------
------------------------------------------------
local o = vim.opt
local g = vim.g

vim.cmd.colorscheme("kanagawa")

o.shell = "/usr/bin/zsh"

o.wildmenu = true

o.encoding = "utf-8"

o.number = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.autoindent = true
o.smartindent = true

o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false

o.termguicolors = true

o.hlsearch = false
o.incsearch = true
o.inccommand = "split"

o.swapfile = false
o.backup = false
o.undodir = { os.getenv("HOME") .. "/.local/share/nvim/undo" }
o.undofile = true

o.updatetime = 50

o.virtualedit = "block"

o.ignorecase = true
o.smartcase = true

o.laststatus = 3

o.fillchars = { eob = " " }

o.signcolumn = "yes"

g.perl_host_prog = "/usr/bin/perl"


------------------------------------------------
-------------------- REMAPS --------------------
------------------------------------------------
local remap = vim.keymap.set

remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")

remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")

remap("n", "<C-e>", vim.cmd.cprevious, { silent = true })
remap("n", "<C-c>", vim.cmd.cnext, { silent = true })

remap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


------------------------------------------------
------------------- AUTOCMDS -------------------
------------------------------------------------
vim.api.nvim_create_augroup("FileTypes", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*.norg",
    group = "FileTypes",
    callback = function()
        o.conceallevel = 2
        remap("n", "<leader>ff", "<cmd>Telescope neorg find_norg_files<CR>")
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.astro", "*.js*", "*.ts*", "*.css", "*.html", "*.ocaml", "*.php" },
    group = "FileTypes",
    callback = function()
        o.tabstop = 2
        o.shiftwidth = 2
        o.softtabstop = 2
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.ua" },
    group = "FileTypes",
    callback = function()
        vim.lsp.start({
            name = 'uiua_lsp',
            cmd = { 'uiua', 'lsp' },
        })
    end,
})

------------------------------------------------
------------------- NEOVIDE --------------------
------------------------------------------------
o.guifont = "Hack Nerd Font Mono:h14"
g.neovide_transparency = 0.9
g.neovide_hide_mouse_when_typing = true
g.neovide_cursor_animation_length = 0.05

vim.filetype.add({ extension = { wgsl = "wgsl" } })
