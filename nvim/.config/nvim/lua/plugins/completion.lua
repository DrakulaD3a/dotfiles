return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "kdheepak/cmp-latex-symbols", -- LaTeX symbols
        },
        config = function()
            local ok, cmp = pcall(require, "cmp")
            if not ok then
                return
            end
            
            local ok, luasnip = pcall(require, "luasnip")
            if not ok then
                return
            end

            cmp.setup({
                mapping = {
                    ["<C-b>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Cr>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                sources = {
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "luasnip" },
                    { name = "buffer",  keyword_lenght = 5 },
                    { name = "crates" },
                },

                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        vim_item.kind = string.format("%s", require("lukas.cmp").kind_icons[vim_item.kind])

                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[API]",
                            buffer   = "[File]",
                            luasnip  = "[Snip]",
                            path     = "[Path]",
                            crates   = "[Crate]",
                        })[entry.source.name]

                        return vim_item
                    end,
                    expandable_indicator = true,
                },
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local ok, ls = pcall(require, "luasnip")
            if not ok then
                return
            end

            require("luasnip.loaders.from_vscode").lazy_load()

            ls.config.set_config {
                history = true,
            }

            vim.keymap.set({ "i", "s" }, "<C-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })
        end
    },
}
