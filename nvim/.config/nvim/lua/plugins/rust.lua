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
                        vim.keymap.set("n", "<leader>rc", rt.open_cargo_toml.open_cargo_toml, opts)
                        vim.keymap.set("n", "<leader>rd", rt.external_docs.open_external_docs, opts)
                        vim.keymap.set("n", "<leader>rw", rt.workspace_refresh.reload_workspace, opts)
                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {
                                command = "clippy",
                                extraArgs = { "--all", "--", "-W", "clippy::pedantic", "-W", "clippy::nursery", "-W", "clippy::unwrap_used", "-W", "clippy::expect_used" },
                            }
                        }
                    },
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
