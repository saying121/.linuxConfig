local lsp = require 'lsp.nvim-lsp-conf'
-- python
require 'lspconfig'.pylsp.setup {
    cmd = { 'pylsp' },
    settings = {
        pylsp = {
            plugins = {
                autopep8 = {
                    enabled = false,
                },
                jedi = {
                    auto_import_moduls = { 'numpy', 'math' },
                },
                -- 不提示格式
                pycodestyle = {
                    enabled = false,
                },
                rope_autoimport = {
                    enabled = true,
                    memory = true,
                },
                yapf = {
                    enabled = false,
                }
            }
        }
    },
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
