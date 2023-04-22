-- Just for the looks
local remap = vim.keymap.set

-- Open netrw
remap("n", "<leader>e", vim.cmd.Ex)

-- Cursor always in the middle of the screen
remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")

local terminal_bufnr = -1
local prev_bufnr = -1
-- Function to check whether a terminal buffer exists
local function toggle_term()
	if terminal_bufnr == -1 then
		prev_bufnr = vim.api.nvim_get_current_buf()
		if terminal_bufnr == -1 then
			terminal_bufnr = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_set_current_buf(terminal_bufnr)
			vim.cmd('term zsh')
			vim.api.nvim_command("startinsert")
		else
			vim.api.nvim_set_current_buf(terminal_bufnr)
			vim.api.nvim_command("startinsert")
		end
	else
		vim.api.nvim_buf_delete(terminal_bufnr, { force = true })
		vim.api.nvim_set_current_buf(prev_bufnr)
		terminal_bufnr = -1
	end
end

-- Terminal spawn and despawn
remap("n", "<leader>t", toggle_term)
remap("t", "<leader>t", toggle_term)

remap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
remap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
