require 'lsp.cmp'
local lsp = require 'lsp.lsp-config'
require 'lsp.mason-config'
require 'lsp.null-ls-config'

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
-- java
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

require 'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
-- python
-- require 'lspconfig'.pyright.setup {
--     capabilities = capabilities,
--     on_attach = lsp.on_attach,
--     flags = lsp.lsp_flags,
-- }
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
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

-- require 'lspconfig'.jedi_language_server.setup{
--     capabilities=capabilities,
--     on_attach=lsp.on_attach,
--     flags=lsp.lsp_flags,
-- }
-- rust
require 'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

-- javascript
require 'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
-- lua
require 'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
-- awk
require 'lspconfig'.awk_ls.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
-- viml
require 'lspconfig'.vimls.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

require 'lspconfig'.yamlls.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}

require 'lspconfig'.sqlls.setup {
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    flags = lsp.lsp_flags,
}
