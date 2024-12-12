local bufnr = vim.api.nvim_get_current_buf()
local nmap = function(keys, func)
    vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true, noremap = true })
end

vim.keymap.set("n", "K", function()
    vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>dr", function()
    vim.cmd.RustLsp({ "debug" })
end, { silent = true, buffer = bufnr })

nmap("gD", vim.lsp.buf.declaration)

nmap("K", vim.lsp.buf.hover)

nmap("<leader>fm", vim.cmd.RustFmt)
nmap("<leader>rn", vim.lsp.buf.rename)

nmap("g[", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)
nmap("g]", function()
    vim.diagnostic.jump({ count = 1, float = true })
end)
nmap("gl", vim.diagnostic.open_float)

if pcall(require, "telescope.builtin") then
    nmap("<leader>rr", require("telescope.builtin").lsp_references)
    nmap("gd", require("telescope.builtin").lsp_definitions)
else
    nmap("gd", vim.lsp.buf.definition)
end
if pcall(require, "actions-preview") then
    nmap("<leader>ca", require("actions-preview").code_actions)
end
