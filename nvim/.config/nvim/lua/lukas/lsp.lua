require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = {},
    automatic_installation = true,
})

require("neodev").setup();

local lspconfig = require "lspconfig"

local signs = { Error = "-", Warn = "|", Hint = "~", Info = "i" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local function setup()
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
end

local function lsp_highlight_document(client)
    if client.server_capabilities.document_highlight then
        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = 0,
            callback = function()
                vim.lsp.buf.document_highlight()
            end
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = 0,
            callback = function()
                vim.lsp.buf.clear_references()
            end
        })
    end
end

local function lsp_keymaps(bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rr", require("telescope.builtin").lsp_references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
    vim.keymap.set("n", "<leader>fm", function()
        vim.lsp.buf.format { async = true }
    end, opts)
end

local cmp_nvim_lsp = require "cmp_nvim_lsp"

setup()

-- Setups all installed servers
for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    lspconfig[server].setup({
        on_attach = function(client, bufnr)
            lsp_keymaps(bufnr)
            lsp_highlight_document(client)
        end,
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
    })

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
        on_attach = function(client, bufnr)
            lsp_keymaps(bufnr)
            lsp_highlight_document(client)
            client.server_capabilities.documentFormattingProvider = false
        end,
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
    })

    local clang_capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    clang_capabilities.offsetEncoding = { "utf-16" }

    lspconfig["clangd"].setup({
        on_attach = function(client, bufnr)
            lsp_keymaps(bufnr)
            lsp_highlight_document(client)
            client.server_capabilities.documentFormattingProvider = false
        end,
        capabilities = clang_capabilities,
    })
end
