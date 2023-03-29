local o = vim.opt
local g = vim.g

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
o.undodir = { os.getenv("HOME").."/.local/share/nvim/undo" }
o.undofile = true

o.updatetime = 50

o.mouse = "i"

o.laststatus = 3
-- o.cmdheight = 0

o.fillchars = { eob = " " }

o.signcolumn = "yes"

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		o.formatoptions:remove("c")
		o.formatoptions:remove("r")
		o.formatoptions:remove("o")
	end,
})

-- netrw
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_list_hide = ".git"

function Transparent()
	local groups = {
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	}

	for _, group in pairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
end
