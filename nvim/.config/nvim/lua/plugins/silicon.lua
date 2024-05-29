return {
    dir = "~/projects/silicon.lua/",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local ok, silicon = pcall(require, "silicon")
        if not ok then
            return
        end

        silicon.setup({
            output = "~/personal/pictures/screenshots/silicon/${year}-${month}-${date}_${time}.png",
        })

        local ok, silicon_utils = pcall(require, "silicon.utils")
        if not ok then
            return
        end

        vim.api.nvim_create_augroup("SiliconRefresh", { clear = true })
        vim.api.nvim_create_autocmd({ "ColorScheme" }, {
            group = "SiliconRefresh",
            callback = function()
                silicon_utils.build_tmTheme()
                silicon_utils.reload_silicon_cache({ async = true })
            end,
            desc = "Reload silicon themes cache on colorscheme switch",
        })
    end,
    keys = {
        {
            "<leader>ss",
            function()
                require("silicon").visualise_api({ visible = true })
            end,
            desc = "Silicon",
        },
        {
            "<leader>ss",
            function()
                require("silicon").visualise_api({})
            end,
            mode = "v",
            desc = "Silicon",
        },
    },
}
