return {
	{
		"hrsh7th/nvim-cmp",
		init = function()
			require("lukas.cmp")
		end,
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"kdheepak/cmp-latex-symbols", -- LaTeX symbols
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		init = function ()
			require("lukas.luasnip")
		end
	},
	"rafamadriz/friendly-snippets",
}
