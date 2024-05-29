return {
    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        keys = {
            { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "git blame line" },
        },
    },
}
