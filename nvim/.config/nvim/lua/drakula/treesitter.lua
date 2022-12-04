local status_ok, config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

config.setup {
	ensure_installed = "all",
	sync_install = false,
	ignore_install = {""},
	highlight = {
		enable = true,
		disable = {""},
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = {""} },
}
