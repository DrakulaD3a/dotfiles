local M = {}

M.on_attach = function(client, bufnr)
    local nmap = function(keys, func)
        vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true, noremap = true })
    end

    local ok, builtin = pcall(require, "telescope.builtin")
    if not ok then
        return
    end

    local ok, actions_preview = pcall(require, "actions-preview")
    if not ok then
        return
    end

    nmap("gd", builtin.lsp_definitions)
    nmap("gD", vim.lsp.buf.declaration)

    nmap("K", vim.lsp.buf.hover)

    nmap("<leader>ca", actions_preview.code_actions)
    nmap("<leader>rr", builtin.lsp_references)
    nmap("<leader>rn", vim.lsp.buf.rename)

    nmap("g[", vim.diagnostic.goto_prev)
    nmap("g]", vim.diagnostic.goto_next)
    nmap("gl", vim.diagnostic.open_float)
end

M.additional_servers = function()
    local ok, lspconfig = pcall(require, "lspconfig")
    if not ok then
        return
    end

    local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not ok then
        return
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local opts = {
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
        on_attach = require("lukas.lsp").on_attach,
    }

    lspconfig["ocamllsp"].setup(opts)

    lspconfig["hls"].setup(opts)

    lspconfig["gleam"].setup(opts)
end

return M
