return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                opts = {},
            }
        },
        config = function()
            require("lukas.dap")
        end
    },
    "nvim-telescope/telescope-dap.nvim",
}
