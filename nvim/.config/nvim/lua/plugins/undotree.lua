return {
    {
        "jiaoshijie/undotree",
        config = function()
            local ok, ut = pcall(require, "undotree");
            if not ok then
                return
            end

            ut.setup();

            vim.keymap.set('n', '<leader>u', ut.toggle, { noremap = true, silent = true })
        end,
    }
}
