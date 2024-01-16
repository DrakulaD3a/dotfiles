return {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        -- Custom telescope picker for Distant servers
        ServersPicker = function(opts)
            opts = opts or {}
            require("telescope.pickers").new(opts, {
                prompt_title = "Select Server",
                finder = require "telescope.finders".new_table {
                    results = { "deimos", "phobos" }
                },
                sorter = require "telescope.config".values.generic_sorter(opts),
                attach_mappings = function(prompt_bufnr)
                    require("telescope.actions").select_default:replace(function()
                        local selection = require "telescope.actions.state".get_selected_entry()
                        require "telescope.actions".close(prompt_bufnr)
                        vim.cmd("DistantConnect ssh://" .. selection.value)
                    end)

                    return true
                end,
            }):find()
        end

        require "startup".setup({
            header = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Header",
                margin = 200,
                content = {
                    [[                                                    ]],
                    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
                    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
                    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
                    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
                    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
                    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
                    [[                                                    ]],
                },
                highlight = "Statement",
                default_color = "",
                oldfiles_amount = 0,
            },
            body = {
                type = "mapping",
                oldfile_directory = false,
                align = "center",
                fold_section = false,
                content = {
                    { " Find File", "Telescope find_files", "<leader>ff" },
                    { " Find Word", "Telescope live_grep", "<leader>fs" },
                    { " Recent Files", "Telescope oldfiles", "<leader>of" },
                    { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
                    { " New File", "lua require'startup'.new_file()", "<leader>nf" },
                    { " Find Todos", "TodoTelescope", "<leader>tt" },
                },
                oldfile_amount = 0,
                highlight = "String",
            },
            footer = {
                type = "mapping",
                oldfile_directory = false,
                align = "center",
                fold_section = false,
                content = {
                    { "󰙅 Oil Open", "lua require'oil'.open()", "<leader>ft" },
                    { "󱞁 Obsidian open", "edit ~/personal/obsidian-vault/welcome.md", "<leader>oo" },
                    { "󰣀 Distant connect", ":lua ServersPicker()", "<leader>dc" },
                    { "󰣀 Distant open", "DistantOpen", "<leader>do" },
                },
                oldfile_amount = 0,
                highlight = "String",
            },

            options = {
                mapping_keys = true,
                cursor_column = 0.5,
                empty_lines_between_mappings = true,
                disable_statuslines = true,
            },
            mappings = {
                execute_command = "<CR>",
                open_file = "o",
                open_file_split = "<c-o>",
                open_section = "<TAB>",
                open_help = "?",
            },
            parts = {
                "header",
                "body",
                "footer",
            },
        })
    end
}
