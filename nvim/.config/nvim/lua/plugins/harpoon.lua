return {
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon_ui = require("harpoon.ui");
            local harpoon_mark = require("harpoon.mark")

            vim.keymap.set("n", "<leader>hm", harpoon_mark.add_file, { noremap = true, silent = true });
            vim.keymap.set("n", "<leader>ht", harpoon_ui.toggle_quick_menu, { noremap = true, silent = true });
            for i = 1, 4, 1 do
                vim.keymap.set("n", "<leader>h" .. i, function () harpoon_ui.nav_file(i) end, { noremap = true, silent = true });
            end
        end,
    }
}
