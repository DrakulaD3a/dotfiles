return {
    "stevearc/oil.nvim",
    config = function()
        local ok, oil = pcall(require, "oil")
        if not ok then
            return
        end

        oil.setup()
        vim.keymap.set("n", "-", oil.open)
    end,
}
