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
vim.o.undodir = vim.fn.stdpath("data") .. "/undo"
vim.o.undofile = true
vim.o.updatetime = 50
vim.o.virtualedit = "block"
vim.o.smartcase = true
vim.o.laststatus = 3
vim.o.signcolumn = "yes"
vim.o.winborder = "solid"

vim.api.nvim_create_augroup("FileTypes", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.astro", "*.js*", "*.ts*", "*.css", "*.html", "*.ocaml", "*.php", "*.gleam", "*.vue" },
    group = "FileTypes",
    callback = function()
        vim.o.tabstop = 2
        vim.o.shiftwidth = 2
        vim.o.softtabstop = 2
    end,
})

vim.pack.add({
    { src = "https://github.com/rebelot/kanagawa.nvim" },

    { src = "https://github.com/stevearc/oil.nvim" },

    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },

    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },

    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/mfussenegger/nvim-lint" },

    { src = "https://github.com/L3MON4D3/LuaSnip" },
})

require("oil").setup()
vim.keymap.set("n", "-", ":Oil<CR>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fs", require("multipick").multigrep)
vim.keymap.set("n", "grr", builtin.lsp_references)
vim.keymap.set("n", "gri", builtin.lsp_implementations)
vim.keymap.set("n", "grt", builtin.lsp_type_definitions)

vim.diagnostic.config({
    jump = {
        on_jump = function()
            vim.diagnostic.open_float({ focus = false })
        end,
    },
    virtual_text = { prefix = "●" },
})
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})
vim.lsp.enable({
    "lua_ls",
    "rust_analyzer",
    "clangd",
    "tinymist",
    "zls",
    "ts_ls",
    "tailwindcss",
    "prismals",
    "ocamllsp",
    "hls",
    "gleam",
    "eslint",
    "html",
    "cssls",
})

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
    default_format_opts = {
        lsp_format = "fallback",
    },
})
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.keymap.set("n", "<leader>fm", require("conform").format)

require("lint").linters_by_ft = {
    sh = { "shellcheck" },
    bash = { "shellcheck" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "rust",
        "c",
        "lua",
        "markdown",
        "markdown_inline",
        "vimdoc",
    },
    modules = {},
    ignore_install = {},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
})

require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })

local ls = require("luasnip")
vim.keymap.set("i", "<C-e>", ls.expand)
vim.keymap.set({ "i", "s" }, "<C-j>", function()
    ls.jump(1)
end)
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    ls.jump(-1)
end)

vim.cmd.colorscheme("kanagawa")
