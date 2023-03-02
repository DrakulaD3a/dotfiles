return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lukas.lsp");
		end,
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"folke/neodev.nvim",
}
