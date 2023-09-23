return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        messages = {
            enabled = true,
            view = false,
            view_warn = false,
            view_error = false,
            view_history = false,
            view_search = false
        },
        lsp = {
            progress = {
                enabled = false
            },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
