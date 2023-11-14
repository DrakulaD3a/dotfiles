return {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
        require('distant'):setup({
            servers = {
                ['rust_analyzer'] = {
                    lsp = {
                        root_dir = '/home/lukas/catscii',
                    },
                },
            },
        })
    end
}
