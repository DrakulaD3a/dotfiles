return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-smart-history.nvim",
            "kkharji/sqlite.lua",
        },
        config = function()
            local ok, telescope = pcall(require, "telescope")
            if not ok then
                return
            end

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git", "libraries", "cmake" },
                    mappings = {
                        i = { ["<c-t>"] = require("trouble.sources.telescope").open },
                        n = { ["<c-t>"] = require("trouble.sources.telescope").open },
                    },
                    history = {
                        path = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "telescope_history.sqlite3"),
                        limit = 100,
                    },
                },
            })
            local builtin = require("telescope.builtin")

            -- Just setting basic shortcuts, nothing fancy
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fs", require("lukas.telescope").multigrep, {})

            pcall(require("telescope").load_extension, "macros")
            pcall(require("telescope").load_extension, "distant")
            pcall(require("telescope").load_extension, "smart_history")

            vim.keymap.set("n", "<leader>fq", "<cmd>Telescope macros<CR>", {})
            vim.keymap.set("n", "<leader>fe", "<cmd>Telescope emoji<CR>", {})
            vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>", {})
        end,
    },
}
