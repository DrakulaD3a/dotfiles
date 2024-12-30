local M = {}

M.on_attach = function(client, bufnr)
    local nmap = function(keys, func)
        vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true, noremap = true })
    end

    nmap("gD", vim.lsp.buf.declaration)

    nmap("K", vim.lsp.buf.hover)

    nmap("<leader>fm", vim.lsp.buf.format)
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
end

local ok, cmp_capabilities = pcall(function()
    return require("cmp_nvim_lsp").default_capabilities()
end)
if not ok then
    M.capabilities = cmp_capabilities
else
    M.capabilities = vim.lsp.protocol.make_client_capabilities()
end

M.default_config = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
}

M.without_formatting = vim.tbl_extend("force", M.default_config, {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        M.on_attach(client, bufnr)
    end,
})

M.servers = {
    astro = M.without_formatting,
    cssls = M.default_config,
    clangd = M.default_config,
    eslint = M.default_config,
    html = M.default_config,
    lua_ls = M.default_config,
    marksman = M.default_config,
    prismals = M.default_config,
    -- Using rustaceanvim for rust-analyzer
    --[[ rust_analyzer = vim.tbl_extend("force", M.default_config, {
        settings = {
            rust_analyzer = {
                check = { allTargets = false },
                diagnostics = { enable = false },
                checkOnSave = { enable = false },
            },
        },
    }), ]]
    tailwindcss = M.default_config,
    taplo = M.default_config,
    ts_ls = M.without_formatting,
    zls = M.default_config,
}

M.additional_servers = {
    ocamllsp = M.default_config,
    hls = M.default_config,
    gleam = M.default_config,
    --[[ bacon_ls = vim.tbl_extend("force", M.default_config, {
        settings = {
            locationsFile = ".bacon-locations",
            baconSettings = {
                spawn = true,
                command = "bacon better-clippy",
            },
        },
    }), ]]
}

M.setup_servers = function()
    require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = {
            exclude = vim.tbl_keys(M.additional_servers),
        },
    })
    for server_name, server_config in pairs(vim.tbl_extend("force", M.servers, M.additional_servers)) do
        require("lspconfig")[server_name].setup(server_config)
    end
end

return M
