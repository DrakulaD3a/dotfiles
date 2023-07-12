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
