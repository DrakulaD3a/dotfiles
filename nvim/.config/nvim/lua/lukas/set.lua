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

o.swapfile = false
o.backup = false
o.undodir = { os.getenv("HOME") .. "/.local/share/nvim/undo" }
o.undofile = true

o.updatetime = 50

-- Disable statusline
-- o.laststatus = 0
-- o.cmdheight = 0

o.laststatus = 3

o.fillchars = { eob = " " }

o.signcolumn = "yes"

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "*",
    callback = function()
        o.formatoptions:remove("c")
        o.formatoptions:remove("r")
        o.formatoptions:remove("o")
        vim.cmd("TSBufEnable highlight")
    end,
})

-- For neovide
o.guifont = "Hack Nerd Font Mono:h16"
g.neovide_transparency = 0.9
g.neovide_hide_mouse_when_typing = true
g.perl_host_prog = "/usr/bin/perl"
