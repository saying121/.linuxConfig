local lsp = require 'lsp.nvim-lsp-conf'
-- viml
require 'lspconfig'.vimls.setup {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
