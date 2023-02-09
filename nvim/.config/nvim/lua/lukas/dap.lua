local dap = require("dap");
local ui = require("dapui");

vim.keymap.set("n", "<F5>", dap.continue, { desc = "start debugging" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "step out" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
vim.keymap.set("n", "<leader>dv", function () dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "toggle breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "open repl" })
vim.keymap.set("n", "<leader>du", ui.toggle, { desc = "toggle dap ui" })

dap.adapters.lldb = {
	type = "executable";
	command = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/codelldb';
	name = "lldb";
}

dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},

		runInTerminal = false,
	}
}
