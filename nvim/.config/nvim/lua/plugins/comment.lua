return {
    {
        "numToStr/Comment.nvim",
        opts = {
            -- What key to press in normal or visual mode to add comment
            opleader = {
                -- Line comment - //
                line = "gc",
                -- Block comment - /* */
                block = "gb",
            },

            mappings = {
                -- Mappings like gcc, gbc, ...
                basic = true,

                -- Mappings like gco, gcO, gcA
                extra = true,
            },
        }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            signs = false,
            keywords = {
                FIXME = {
                    color = "warning",
                },
                IDEA = {
                    color = "hint",
                },
            },
        }
    },
}
