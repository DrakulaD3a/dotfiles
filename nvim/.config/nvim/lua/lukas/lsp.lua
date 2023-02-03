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
	"phpactor",
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

local M = {}

M.setup = function()
	vim.diagnostic.config({
		-- disable virtual text
		virtual_text = false,
		signs = false,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
			autogroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			autogroup END
			]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

M.setup()

for _, server in pairs(servers) do
	server = vim.split(server, "@")[1]

	lspconfig[server].setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	})
end
