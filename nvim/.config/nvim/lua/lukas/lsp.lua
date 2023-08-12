require("mason").setup()
require("mason-lspconfig").setup()
require("neodev").setup();

local lspconfig = require "lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>rr", require("telescope.builtin").lsp_references, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fm", function()
            vim.lsp.buf.format { async = true }
        end, { noremap = true, silent = true })
    end
})

vim.diagnostic.config({
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
        style = "minimal",
    },
    -- disable virtual text
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
    lspconfig[server].setup({
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
    })
end

-- Neodev stuff
lspconfig["lua_ls"].setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            },
            workspace = {
                checkThirdParty = false,
            },
        },
    },
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
})

lspconfig["ocamllsp"].setup({
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
})

lspconfig["hls"].setup({
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
})
