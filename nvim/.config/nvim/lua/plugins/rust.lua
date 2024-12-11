return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        ["rust-analyzer"] = {
                            check = { allTargets = false },
                            diagnostics = { enable = false },
                            checkOnSave = { enable = false },
                        },
                    },
                },
                dap = {},
            }
        end,
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = true,
    },
}
