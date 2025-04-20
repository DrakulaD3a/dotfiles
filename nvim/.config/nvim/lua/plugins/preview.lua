return {
    "SylvanFranklin/omni-preview.nvim",
    dependencies = {
        -- Typst
        { "chomosuke/typst-preview.nvim", lazy = true },
        -- CSV
        { "hat0uma/csvview.nvim", lazy = true },
    },
    config = function()
        require("omni-preview").setup()
        require("typst-preview").setup({
            dependencies_bin = {
                ["tinymist"] = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/tinymist",
                ["websocat"] = nil,
            },
        })
    end,
    keys = {
        { "<leader>po", "<cmd>OmniPreview start<CR>" },
    },
}
