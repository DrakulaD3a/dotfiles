local servers = {
  "sumneko_lua",
  "clangd",
  "html",
  "eslint",
  "tsserver",
  "rust_analyzer",
  "cssls",
  "cmake",
  "wgsl_analyzer",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

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

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "drakula.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
