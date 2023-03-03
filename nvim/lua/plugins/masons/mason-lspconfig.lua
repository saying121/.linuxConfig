return {
    'williamboman/mason-lspconfig.nvim',
    cmd = 'Mason',
    config = function()
        require 'mason-lspconfig'.setup({
            ensure_installed = {
                'awk_ls',
                'bashls',
                'clangd',
                'emmet_ls',
                'gopls',
                'jdtls',
                -- 'jedi_language_server',
                'jsonls',
                -- 'lua_ls',
                'marksman',
                'pylsp',
                -- 'rust_analyzer',
                'sqlls',
                'tsserver',
                'vimls',
                'yamlls',
            },
            -- Can either be:
            --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
            --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
            automatic_installation = true,
        })
    end
}