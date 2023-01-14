local lsp = require 'lsp.nvim-lsp-conf'

require 'lspconfig'.jsonls.setup {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
