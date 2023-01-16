local lsp = require 'lsp.nvim-lsp-conf'
-- lua
require 'lspconfig'.sumneko_lua.setup {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    'vim',
                },
            },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
                -- maxPreload=2000,
                preloadFileSize = 10000,
            },
            telemetry = {
                enable = false
            },
        }
    },
}
