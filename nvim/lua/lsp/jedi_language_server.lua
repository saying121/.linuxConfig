local lsp = require 'lsp.nvim-lsp-conf'
-- python
require 'lspconfig'.jedi_language_server.setup {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
