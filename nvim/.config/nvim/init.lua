vim.g.mapleader = " "

require "lukas.set"
require "lukas.remap"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- cmp Plugins
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	-- LaTeX symbols
	"kdheepak/cmp-latex-symbols",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "lukas.lsp"
		end,
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- ColorPicker
	"uga-rosa/ccc.nvim",

	-- Colorscheme
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			vim.cmd.colorscheme('rose-pine')
		end
	},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- Undotree
	"mbbill/undotree",

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Comment
	"numToStr/Comment.nvim",
})
