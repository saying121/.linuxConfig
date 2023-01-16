local M = {
    'neovim/nvim-lspconfig',
    priority = 1000,
    event = 'BufReadPre',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        {
            'jose-elias-alvarez/null-ls.nvim',
            -- event = 'InsertEnter',
            -- event = 'BufReadPre',
            config = function()

                local null_ls = require 'null-ls'
                null_ls.setup({
                    sources = {
                        null_ls.builtins.formatting.black,
                        null_ls.builtins.formatting.isort,
                        null_ls.builtins.formatting.shfmt,
                        null_ls.builtins.formatting.sql_formatter,
                        null_ls.builtins.formatting.json_tool,
                        -- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" }
                        null_ls.builtins.formatting.prettier,
                        null_ls.builtins.code_actions.shellcheck,
                        -- viml
                        null_ls.builtins.diagnostics.vint,
                        -- js
                        null_ls.builtins.diagnostics.eslint,
                    }
                })

                -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
                -- null_ls.setup({
                --     -- you can reuse a shared lspconfig on_attach callback here
                --     on_attach = function(client, bufnr)
                --         if client.supports_method("textDocument/formatting") then
                --             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                --             vim.api.nvim_create_autocmd("BufWritePre", {
                --                 group = augroup,
                --                 buffer = bufnr,
                --                 callback = function()
                --                     vim.lsp.buf.format({ bufnr = bufnr })
                --                 end,
                --             })
                --         end
                --     end,
                -- })
            end
        },
    },

}

function M.config()
    -- local lsp = require 'lsp.nvim-lsp-conf'
    --
    -- local lsp_conf_dir = vim.fn.stdpath('config') .. '/lua/lsp'
    --
    -- for _, fname in pairs(vim.fn.readdir(lsp_conf_dir)) do
    --     local the_lsp = vim.fn.split(fname, [[\.]])
    --     if 'lua' == the_lsp[2] then
    --         local lsp_name=the_lsp[1]
    --         require('lspconfig')[lsp_name].setup {
    --             capabilities = lsp.capabilities,
    --             on_attach = lsp.on_attach,
    --             flags = lsp.lsp_flags,
    --             -- settings = require( 'lsp.'..the_lsp[1])
    --         }
    --     end
    -- end

    require 'lsp.awk_ls'
    require 'lsp.bashls'
    require 'lsp.clangd'
    require 'lsp.html'
    require 'lsp.jdtls'
    require 'lsp.jedi_language_server'
    require 'lsp.jsonls'
    -- require 'lsp.pylsp'
    -- require 'lsp.pyright'
    require 'lsp.rust_analyzer'
    require 'lsp.sqlls'
    require 'lsp.sumneko_lua'
    -- require 'lspconfig'.sumneko_lua.setup(require("lsp.lua-lsp-for-nvim"))
    require 'lsp.tsserver'
    require 'lsp.vimls'
    require 'lsp.yamlls'

end

return M
