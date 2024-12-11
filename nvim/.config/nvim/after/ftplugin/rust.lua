local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "K", function()
    vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>dr", function()
    vim.cmd.RustLsp({ "debug" })
end, { silent = true, buffer = bufnr })
