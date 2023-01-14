local lsp = require 'lsp.nvim-lsp-conf'
-- javascript
require 'lspconfig'.tsserver.setup {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
