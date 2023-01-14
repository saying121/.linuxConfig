local lsp = require 'lsp.nvim-lsp-conf'
-- rust
require 'lspconfig'.rust_analyzer.setup {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
