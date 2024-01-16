return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "williamboman/mason.nvim",
            "nvim-telescope/telescope-dap.nvim",
            { "rcarriga/nvim-dap-ui", config = true },
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local ok, mason_nvim_dap = pcall(require, "mason-nvim-dap");
            if not ok then
                return
            end

            mason_nvim_dap.setup({
                ensure_installed = { "codelldb" },
                handlers = {
                    function(config)
                        mason_nvim_dap.default_setup(config)
                    end,
                },
            })

            require("lukas.dap").on_attach()
        end
    },
}
