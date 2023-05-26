return {
    {
        "hrsh7th/nvim-cmp",
        init = function()
            require("lukas.cmp")
        end,
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "kdheepak/cmp-latex-symbols", -- LaTeX symbols
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local ls = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            ls.config.set_config {
                history = true,
            }

            vim.keymap.set({ "i", "s" }, "<C-k>", function ()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-j>", function ()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })
        end
    },
}
