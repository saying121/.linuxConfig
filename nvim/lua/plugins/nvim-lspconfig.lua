local M = {
    'neovim/nvim-lspconfig',
    priority = 1000,
    event='BufReadPre',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
    },
}

function M.config()

    local config = {
        virtual_text = false,
        -- signs = {
        --     active = signs,
        -- },
        update_in_insert = true,
        underling = true,
    }
    vim.diagnostic.config(config)

    local signs = {
        { name = "DiagnosticSignError", text = " " },
        { name = "DiagnosticSignWarn", text = " " },
        { name = "DiagnosticSignHint", text = " " },
        { name = "DiagnosticSignInfo", text = " " },
    }
    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<space>g", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    -- 换到telescope
    -- vim.keymap.set('n', '<space>ll', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<M-cr>", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<space>f", vim.lsp.buf.format, bufopts)
    end

    -- if client.server_capabilities.document_highlight then
    pcall(
        vim.cmd,
        [[
            augroup LspHighlight
            autocmd!
                autocmd CursorHold  *.py,*.lua,*.java,*.c,*.cpp lua vim.lsp.buf.document_highlight()
                autocmd CursorHoldI *.py,*.lua,*.java,*.c,*.cpp lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved *.py,*.lua,*.java,*.c,*.cpp lua vim.lsp.buf.clear_references()
            augroup END
            ]]
    )
    -- end

    lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    }

    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- The following example advertise capabilities to `clangd`.
    require 'lspconfig'.bashls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }

    require 'lspconfig'.clangd.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }
    -- java
    require 'lspconfig'.jdtls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }

    require 'lspconfig'.jsonls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }

    require 'lspconfig'.html.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }
    -- python
    -- require 'lspconfig'.pyright.setup {
    --     capabilities = capabilities,
    --     on_attach = on_attach,
    --     flags = lsp_flags,
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
        on_attach = on_attach,
        flags = lsp_flags,
    }

    -- require 'lspconfig'.jedi_language_server.setup{
    --     capabilities=capabilities,
    --     on_attach=on_attach,
    --     flags=lsp_flags,
    -- }
    -- rust
    require 'lspconfig'.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }

    -- javascript
    require 'lspconfig'.tsserver.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }
    -- lua
    require 'lspconfig'.sumneko_lua.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }
    -- awk
    require 'lspconfig'.awk_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }
    -- viml
    require 'lspconfig'.vimls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }

    require 'lspconfig'.yamlls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }

    require 'lspconfig'.sqlls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
    }
end

return M
