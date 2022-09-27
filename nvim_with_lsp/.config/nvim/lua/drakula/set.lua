local o = vim.opt

o.wildmenu = true

o.encoding = "utf-8"

o.number = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

o.autoindent = true
o.smartindent = true

o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false

o.termguicolors = true

o.hlsearch = false
o.incsearch = true

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME").."/.local/share/nvim/undo"
o.undofile = true

o.updatetime = 50

o.mouse = "a"

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
