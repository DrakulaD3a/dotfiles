return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lukas.lsp");
        end,
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls");

            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.eslint_d,
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = {
                            "javascript", "typescript", "javascriptreact", "typescriptreact",
                        }
                    }),
                    null_ls.builtins.formatting.astyle,
                }
            })
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                lightbulb = {
                    enable = false,
                },
                symbol_in_winbar = {
                    enable = false,
                },
                ui = {
                    title = false,
                    border = "rounded",
                },
                beacon = {
                    enable = false,
                },
                diagnostic = {
                    show_code_action = false,
                },
            })
        end,
    },
}
