return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            disable_background = true,
            disable_float_background = true,
        },
    },
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = false,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    {
        "rebelot/kanagawa.nvim",
        opts = {
            transparent = false,

            overrides = function(colors)
                local theme = colors.theme
                return {
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },

                    -- Save an hlgroup with dark background and dimmed foreground
                    -- so that you can use it where your still want darker windows.
                    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                    -- Popular plugins that open floats will link to NormalFloat by default;
                    -- set their background accordingly if you wish to keep them dark and borderless
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                }
            end,
        },
    },
}
