return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            config = true,
        },
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "aznhe21/actions-preview.nvim",
        {
            "stevearc/conform.nvim",
            config = true,
        },
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

        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { "prettier", "prettierd", stop_after_first = true },
                javascriptreact = { "prettier", "prettierd", stop_after_first = true },
                typescript = { "prettier", "prettierd", stop_after_first = true },
                typescriptreact = { "prettier", "prettierd", stop_after_first = true },
                c = { "clang-format" },
            },
        })
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
