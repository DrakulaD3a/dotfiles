return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "rust", "wgsl", "c", "lua", "markdown", "markdown_inline", "vimdoc", "html", "css",
            "typescript", "tsx" },

        sync_install = false,

        -- When opening file, if I dont have treesitter downloaded for, automatically download
        auto_install = true,

        -- Enable syntax highlighting using treesitter
        highlight = {
            enable = true,

            additional_vim_regex_highlighting = false,
        },

        -- Enable indenting using treesitter
        indent = {
            enable = true,
        },

        playground = {
            enable = true,
            disable = {},
            updatetime = 0,          -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = 'o',
                toggle_hl_groups = 'i',
                toggle_injected_languages = 't',
                toggle_anonymous_nodes = 'a',
                toggle_language_display = 'I',
                focus_language = 'f',
                unfocus_language = 'F',
                update = 'R',
                goto_node = '<cr>',
                show_help = '?',
            },
        },
    },
}
