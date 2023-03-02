return {
	"Exafunction/codeium.vim",
	config = function ()
		vim.g.codeium_disable_bindings = 1;
		vim.keymap.set("i", "<C-Space>", function () return vim.fn["codeium#Accept"]() end, { expr = true });
		vim.keymap.set("i", "<C-;>", function () return vim.fn["codeium#CycleCompletions"](1) end, { expr = true });
		vim.keymap.set("i", "<C-,>", function () return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true });
	end
}
