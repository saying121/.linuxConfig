local lsp = require 'lsp.nvim-lsp-conf'
-- java
require 'lspconfig'.jdtls.setup {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
