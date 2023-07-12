return {
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon_ui = require("harpoon.ui");
            local harpoon_mark = require("harpoon.mark")

            vim.keymap.set("n", "<leader>hm", harpoon_mark.add_file, { noremap = true, silent = true });
            vim.keymap.set("n", "<leader>ht", harpoon_ui.toggle_quick_menu, { noremap = true, silent = true });
            vim.keymap.set("n", "<C-j>", function() harpoon_ui.nav_file(1) end, { noremap = true, silent = true });
            vim.keymap.set("n", "<C-k>", function() harpoon_ui.nav_file(2) end, { noremap = true, silent = true });
            vim.keymap.set("n", "<C-l>", function() harpoon_ui.nav_file(3) end, { noremap = true, silent = true });
            vim.keymap.set("n", "<C-;>", function() harpoon_ui.nav_file(4) end, { noremap = true, silent = true });
        end,
    }
}
