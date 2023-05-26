return {
    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup {
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
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            local todo_comments = require("todo-comments");
            todo_comments.setup {
                signs = false,
                keywords = {
                    FIXME = {
                        color = "warning",
                    },
                },
            }
        end,
    },
}
