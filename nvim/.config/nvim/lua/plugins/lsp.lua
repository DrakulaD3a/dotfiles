return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            config = true,
        },
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "nvimtools/none-ls.nvim",
        "aznhe21/actions-preview.nvim",
    },
    config = function()
        require("lspconfig.ui.windows").default_options.border = "single"

        local border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
        }

        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        require("lukas.lsp").setup_servers()

        local ok, null_ls = pcall(require, "null-ls")
        if not ok then
            return
        end

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.stylua,
            },
        })

        local x = vim.diagnostic.severity
        vim.diagnostic.config({
            float = {
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
            virtual_text = true,
            signs = { text = { [x.ERROR] = "", [x.WARN] = "", [x.HINT] = "", [x.INFO] = "" } },
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            title = false,
        })
    end,
}
