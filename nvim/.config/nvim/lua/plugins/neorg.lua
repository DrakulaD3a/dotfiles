return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-neorg/neorg-telescope"
    },
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {
                config = {
                    icon_preset = "diamond",
                },
            },
            ["core.completion"] = {
                config = {
                    engine = "nvim-cmp",
                    name = "[Neorg]",
                },
            },
            ["core.presenter"] = {
                config = {
                    zen_mode = "zen-mode",
                },
            },
            ["core.esupports.hop"] = {},
            ["core.export"] = {},
            ["core.export.markdown"] = {
                config = {
                    extensions = "all",
                },
            },
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/personal/notes",
                    },
                    default_workspace = "notes",
                    open_last_workspace = true,
                },
            },
            ["core.integrations.telescope"] = {},
        },
    }
}
