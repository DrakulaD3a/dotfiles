return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function ()
			local builtin = require('telescope.builtin')

			-- Just setting basic shortcuts, nothing fancy
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
			vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
		end,
	},
}