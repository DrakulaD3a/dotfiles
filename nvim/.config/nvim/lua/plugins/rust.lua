return {
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {},
    },
    {
        "Canop/nvim-bacon",
        ft = "rust",
        keys = {
            { "<leader>rb", "<cmd>BaconList<CR>", desc = "Bacon List" },
        },
        opts = {},
    },
}
