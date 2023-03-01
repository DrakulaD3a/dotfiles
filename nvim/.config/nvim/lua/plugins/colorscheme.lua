return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			vim.cmd.colorscheme('rose-pine')

			--[[ local groups = {
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
			end ]]

		end
	},
}
