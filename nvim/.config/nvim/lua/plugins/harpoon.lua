return {
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        branch = "harpoon2",
        config = function()
            local ok, harpoon = pcall(require, "harpoon")
            if not ok then
                return
            end

            harpoon:setup({})

            vim.keymap.set("n", "<leader>hm", function()
                harpoon:list():add()
            end)
            vim.keymap.set("n", "<leader>ht", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)
            vim.keymap.set("n", "<C-j>", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "<C-k>", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "<C-l>", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "<C-;>", function()
                harpoon:list():select(4)
            end)
        end,
    },
}
