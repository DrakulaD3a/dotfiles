return {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            journal = "~/personal/notes/journal",
							coding = "~/personal/notes/coding",
							school = "~/personal/school/notes",
                        },
                    },
                },
            },
        },
		ft = "norg",
        dependencies = { "nvim-lua/plenary.nvim" },
    }
}
