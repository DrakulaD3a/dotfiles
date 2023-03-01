return {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {
					config = {
						folds = false,
						icon_preset = "diamond",
					}
				}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            journal = "~/personal/notes/journal",
							coding = "~/personal/notes/coding",
							school = "~/personal/school",
							zettelkasten = "~/personal/zettelkasten",
                        },
						default_workspace = "coding",
                    },
                },
            },
        },
        dependencies = { "nvim-lua/plenary.nvim" },
    }
}
