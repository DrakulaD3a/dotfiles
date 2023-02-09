return {
	{
		"numToStr/Comment.nvim",
		config = function ()
			require("Comment").setup {
				-- What key to press in normal or visual mode to add comment
				opleader = {
					-- Line comment - //
					line = "gc",
					-- Block comment - /* */
					block = "gb",
				},

				mappings = {
					-- Mappings like gcc, gbc, ...
					basic = true,

					-- Mappings like gco, gcO, gcA
					extra = true,
				},

				-- Can be a function called before commenting
				pre_hook = nil,

				-- Can be a function called after commenting
				post_hook = nil,

				-- Can be used to ignore certain lines
				ignore = nil,
			}
		end,
	},
}
