return {
    {
        "simrat39/rust-tools.nvim",
        config = function()
            local rt = require("rust-tools");
            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        local opts = { buffer = bufnr, noremap = true }
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)
                        vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, opts)
                        vim.keymap.set("n", "<leader>rr", require("telescope.builtin").lsp_references, opts)
                        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
                        vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)
                        vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts)
                        vim.keymap.set("n", "<leader>fm", function()
                            vim.lsp.buf.format { async = true }
                        end, opts)

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
