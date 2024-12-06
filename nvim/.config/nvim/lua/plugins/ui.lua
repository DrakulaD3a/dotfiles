return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = {
                enable = true,
                notify = true,
                size = 1024 * 1024, -- 1MiB
            },
            notifier = {
                enable = true,
                timeout = 3000,
            },
            quickfile = { enable = true },
            git = { enable = true },
            lazygit = { enable = true },
            dashboard = { enable = true },
        },
        keys = {
            {
                "<leader>gg",
                function()
                    Snacks.lazygit()
                end,
                desc = "Lazygit",
            },
            {
                "<leader>gb",
                function()
                    Snacks.git.blame_line()
                end,
                desc = "Git Blame Line",
            },
            {
                "<leader>nn",
                function()
                    Snacks.notifier.hide()
                end,
                desc = "Dismiss All Notifications",
            },
            {
                "<leader>nh",
                function()
                    Snacks.notifier.show_history()
                end,
                desc = "Notification History",
            },
        },
    },
    {
        "folke/zen-mode.nvim",
        config = true,
    },
    {
        "stevearc/dressing.nvim",
        config = true,
    },
}
