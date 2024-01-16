return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim",       config = true },
        { "folke/neodev.nvim",       config = true },
        "hrsh7th/cmp-nvim-lsp",
        "nvimtools/none-ls.nvim",
        "aznhe21/actions-preview.nvim",
        "stevearc/conform.nvim",
    },
    config = function()
        local ok, mason = pcall(require, "mason")
        if not ok then
            return
        end

        mason.setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                },
            },
        })

        local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not ok then
            return
        end

        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "marksman" },
        })

        require("lspconfig.ui.windows").default_options.border = "single"

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
        }

        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        local ok, lspconfig = pcall(require, "lspconfig")
        if not ok then
            return
        end
        local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        if not ok then
            return
        end

        mason_lspconfig.setup_handlers({
            function(server)
                lspconfig[server].setup({
                    capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
                    on_attach = require("lukas.lsp").on_attach,
                })
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
                    on_attach = require("lukas.lsp").on_attach,
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
                })
            end,
        })

        require("lukas.lsp").additional_servers()

        local ok, null_ls = pcall(require, "null-ls")
        if not ok then
            return
        end

        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.code_actions.eslint_d,
                null_ls.builtins.formatting.prettierd,
            },
        })

        vim.diagnostic.config({
            float = {
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            title = false,
        })

        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end,
}
