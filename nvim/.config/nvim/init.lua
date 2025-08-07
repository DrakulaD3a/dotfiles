vim.g.mapleader = " "
vim.g.localleader = "\\"

vim.o.wildmenu = true
vim.o.encoding = "utf-8"
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.inccommand = "split"
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"
vim.o.undofile = true
vim.o.updatetime = 50
vim.o.virtualedit = "block"
vim.o.smartcase = true
vim.o.laststatus = 3
vim.o.signcolumn = "yes"
vim.o.winborder = "solid"

vim.pack.add({
    { src = "https://github.com/rebelot/kanagawa.nvim" },

    { src = "https://github.com/stevearc/oil.nvim" },

    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },

    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },

    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("oil").setup()
vim.keymap.set("n", "-", ":Oil<CR>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fs", require("custom.multipick").multigrep)
vim.keymap.set("n", "grr", builtin.lsp_references)
vim.keymap.set("n", "gri", builtin.lsp_implementations)
vim.keymap.set("n", "grt", builtin.lsp_type_definitions)

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})
vim.lsp.enable({ "lua_ls", "rust-analyzer", "clangd", "tinymist", "zls" })

vim.diagnostic.config({ jump = { float = true } })

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier", "prettierd", stop_after_first = true },
        javascriptreact = { "prettier", "prettierd", stop_after_first = true },
        typescript = { "prettier", "prettierd", stop_after_first = true },
        typescriptreact = { "prettier", "prettierd", stop_after_first = true },
        c = { "clang-format" },
        typst = { "typstyle" },
    },
})
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.keymap.set("n", "<leader>fm", require("conform").format)

vim.cmd.colorscheme("kanagawa")
