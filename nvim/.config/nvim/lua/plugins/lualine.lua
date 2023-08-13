return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            section_separators = "",
            component_separators = "",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {},
            lualine_c = {
                {
                    "filetype",
                    icon_only = true,
                },
                {
                    "filename",
                    path = 1,
                },
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = { "nvim_lsp" },
                },
            },
            lualine_y = {},
            lualine_z = { "progress" },
        },
        extensions = {
            "lazy",
        },
    },
}
