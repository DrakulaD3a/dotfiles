return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd.colorscheme('tokyonight-night')
		end
	}
}
