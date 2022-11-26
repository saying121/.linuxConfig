require 'lsp.cmp'
-- require('lsp.lsp-installer')
require 'lsp.mason-config'
require 'lsp.mason-lsp-config'
-- require('lsp.lsp-config')
local lsp = require 'lsp.lsp-config'

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- The following example advertise capabilities to `clangd`.
require 'lspconfig'.bashls.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

require 'lspconfig'.clangd.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

require 'lspconfig'.jdtls.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

require 'lspconfig'.jsonls.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

require 'lspconfig'.pyright.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

-- require 'lspconfig'.pylsp.setup {
--     capabilities = capabilities,
--     on_attach = lsp.on_attach,
--     flags = lsp.lsp_flags,
-- }

require 'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

require 'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

require 'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

require 'lspconfig'.sqls.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
