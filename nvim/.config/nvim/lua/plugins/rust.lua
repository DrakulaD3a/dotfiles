return {
    {
        "simrat39/rust-tools.nvim",
        config = function()
            local rt = require("rust-tools");
            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        local opts = { buffer = bufnr, noremap = true }
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)
                        vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, opts)
                    end,
                    standalone = false,
                },
                inlay_hints = {
                    auto = false,
                    show_parameter_hints = false,
                },
                dap = {
                    adapter = {
                        type = "executable",
                        command = "lldb-vscode",
                        name = "rt-lldb",
                    },
                },
            });
        end,
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {},
    },
}
