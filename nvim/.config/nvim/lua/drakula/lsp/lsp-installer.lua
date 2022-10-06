--lsp_installer.on_server_ready(function(server)
	--local opts = {
		--on_attach = require("drakula.lsp.handlers").on_attach,
		--capabilities = require("drakula.lsp.handlers").capabilities,
	--}

	--if server.name == "sumneko_lua" then
		--local sumneko_opts = require("drakula.lsp.settings.sumneko_lua")
		--opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	--end

	--server:setup(opts)
--end)

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "rust_analyzer",
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("drakula.lsp.handlers").on_attach,
    capabilities = require("drakula.lsp.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require "drakula.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "rust_analyzer" then
    local keymap = vim.keymap.set
    local key_opts = { silent = true }

    require("rust-tools").setup {
      tools = {
        on_initialized = function()
          vim.cmd [[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]]
        end,
      },
      server = {
        on_attach = require("drakula.lsp.handlers").on_attach,
        capabilities = require("drakula.lsp.handlers").capabilities,
        settings = {
          ["rust-analyzer"] = {
            lens = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }

    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
