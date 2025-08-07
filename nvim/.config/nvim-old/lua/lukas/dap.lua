local M = {}

M.on_attach = function()
    local ok, dap = pcall(require, "dap")
    if not ok then
        return
    end

    local ok, ui = pcall(require, "dapui")
    if not ok then
        return
    end

    local ok, telescope = pcall(require, "telescope")
    if not ok then
        return
    end

    local nmap = function(keys, func)
        vim.keymap.set("n", keys, func, { noremap = true, silent = true })
    end

    nmap("<F5>", dap.continue)
    nmap("<F10>", dap.step_over)
    nmap("<F11>", dap.step_into)
    nmap("<F12>", dap.step_out)
    nmap("<leader>db", dap.toggle_breakpoint)
    nmap("<leader>dv", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end)
    nmap("<leader>dr", dap.repl.toggle)
    nmap("<leader>du", ui.toggle)

    nmap("<leader>dl", telescope.extensions.dap.list_breakpoints)
end

return M
