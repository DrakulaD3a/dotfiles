return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
                keys = {},
            },
        },
    },
    keys = {
        {
            "m",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = {
                        mode = function(str)
                            return "\\<" .. str
                        end,
                    },
                })
            end,
            desc = "Flash",
        },
        {
            "M",
            mode = { "n", "o", "x" },
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        },
    },
}
