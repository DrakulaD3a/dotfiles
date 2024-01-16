return {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
        local ok, distant = pcall(require, 'distant')
        if not ok then
            return
        end

        distant:setup({
            servers = {
                ['*'] = {
                    lsp = {
                        ['catscii'] = {
                            cmd = '/home/lukas/.local/share/nvim/mason/bin/rust-analyzer',
                            root_dir = 'catscii',
                            file_type = { 'rust' },
                            on_exit = function(code, signal, client_id)
                                local prefix = '[Client ' .. tostring(client_id) .. ']'
                                print(prefix .. ' LSP exited with code ' .. tostring(code))

                                -- Signal can be nil
                                if signal ~= nil then
                                    print(prefix .. ' Signal ' .. tostring(signal))
                                end
                            end,
                        },
                    },
                },
            },
        })
    end
}
