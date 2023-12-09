require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'cmake',
        'lua_ls',
        'julials',
        'texlab',
        -- 'clangd@16.0.2'
    },
})
