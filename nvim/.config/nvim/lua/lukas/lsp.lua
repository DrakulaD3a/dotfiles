require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local function setup()
	vim.diagnostic.config({
		-- disable virtual text
		virtual_text = false,
		signs = false,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
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

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

setup()

-- Setups all installed servers
for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	lspconfig[server].setup({
		on_attach = function(client, bufnr)
			lsp_keymaps(bufnr)
			lsp_highlight_document(client)
		end,
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
	})
end

