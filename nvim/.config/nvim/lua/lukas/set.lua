local o = vim.opt
local g = vim.g

vim.cmd.colorscheme("tokyonight")

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

vim.filetype.add({ extension = { wgsl = "wgsl" } })
