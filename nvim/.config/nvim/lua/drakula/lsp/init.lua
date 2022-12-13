local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "drakula.lsp.mason"
require("drakula.lsp.handlers").setup()
require "drakula.lsp.null-ls"
