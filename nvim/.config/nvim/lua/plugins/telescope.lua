return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local ok, telescope = pcall(require, "telescope")
            if not ok then
                return
            end

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git", "libraries", "cmake" },
                    mappings = {
                        i = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
                        n = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
                    },
                },
            })
            local builtin = require("telescope.builtin")

            -- Just setting basic shortcuts, nothing fancy
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})

            require("telescope").load_extension("macros")
            require("telescope").load_extension("distant")

            vim.keymap.set("n", "<leader>fq", "<cmd>Telescope macros<CR>", {})
            vim.keymap.set("n", "<leader>fe", "<cmd>Telescope emoji<CR>", {})
            vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>", {})
        end,
    },
}
