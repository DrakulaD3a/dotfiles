return {
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        config = function()
            local ok, rt = pcall(require, "rust-tools");
            if not ok then
                return
            end

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
    {
        "Canop/nvim-bacon",
        ft = "rust",
        keys = {
            { "<leader>rb", "<cmd>BaconList<CR>", desc = "Bacon List" },
        },
        opts = {},
    },
}
