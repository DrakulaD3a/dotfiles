return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local ok, trouble = pcall(require, "trouble")
        if not ok then
            return
        end

        trouble.setup({
            position = "right",
        })

        vim.keymap.set("n", "<leader>xx", function()
            trouble.toggle()
        end)
        vim.keymap.set("n", "<leader>xw", function()
            trouble.open({ mode = "workspace_diagnostics" })
        end)
        vim.keymap.set("n", "<leader>xq", function()
            trouble.open({ mode = "quickfix" })
        end)
        vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<CR>")
        vim.keymap.set("n", "<C-c>", function()
            trouble.next({ skip_groups = true, jump = true })
        end)
        vim.keymap.set("n", "<C-e>", function()
            trouble.previous({ skip_groups = true, jump = true })
        end)
    end,
}
