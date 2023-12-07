return {
    {
        "3rd/image.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            backend = "kitty",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = true,
                    filetypes = { "markdown" },
                },
                neorg = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = true,
                    filetypes = { "norg" },
                },
            },
            editor_only_render_when_focused = false,
            tmux_show_only_in_active_window = true,
        },
    },
    {
        "jbyuki/nabla.nvim",
        event = "VeryLazy",
        build = ":TSInstall latex",
        keys = {
            { "<leader>ee", ":lua require('nabla').toggle_virt()<CR>", desc = "Toggle equations" },
            { "<leader>ep", ":lua require('nabla').popup()<CR>", desc = "Popup equations" },
        },
    },
}
