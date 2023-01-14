local lsp = require 'lsp.nvim-lsp-conf'
-- awk
require 'lspconfig'.awk_ls.setup {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
