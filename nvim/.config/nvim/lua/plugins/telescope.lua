return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git", "libraries", "cmake" },
                }
            })
            local builtin = require("telescope.builtin")

            -- Just setting basic shortcuts, nothing fancy
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})

            require("telescope").load_extension("macros")

            vim.keymap.set("n", "<leader>fq", "<cmd>Telescope macros<CR>", {})
        end,
    },
}
