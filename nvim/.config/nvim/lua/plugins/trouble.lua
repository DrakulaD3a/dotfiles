return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local ok, trouble = pcall(require, "trouble")
        if not ok then
            return
        end

        trouble.setup({
            win = {
                position = "right",
            },
        })

        vim.keymap.set("n", "<leader>xx", function()
            trouble.toggle()
        end)
        vim.keymap.set("n", "<leader>xw", function()
            trouble.open({ mode = "diagnostics" })
        end)
        vim.keymap.set("n", "<leader>xq", function()
            trouble.open({ mode = "quickfix" })
        end)
        vim.keymap.set("n", "<leader>xt", function()
            trouble.open({ mode = "todo" })
        end)
        vim.keymap.set("n", "<C-c>", function()
            trouble.next({ jump = true })
        end)
        vim.keymap.set("n", "<C-e>", function()
            trouble.prev({ jump = true })
        end)
    end,
}
