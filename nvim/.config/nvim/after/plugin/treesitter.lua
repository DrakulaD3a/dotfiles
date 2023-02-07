require'nvim-treesitter.configs'.setup {
	sync_install = false,

	-- When opening file, I dont have treesitter downloaded for, automatically download
	auto_install = true,

	-- Enable syntax highlighting using treesitter
	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},

	-- Enable indenting using treesitter
	indent = {
		enable = true;
	},
}
