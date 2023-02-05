local M = {
    'neovim/nvim-lspconfig',
    priority = 1000,
    event = 'BufReadPre',
    dependencies = {
        {
            'jose-elias-alvarez/null-ls.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
            },
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
                        -- null_ls.builtins.code_actions.shellcheck,
                        -- null_ls.builtins.diagnostics.shellcheck,
                        -- viml
                        null_ls.builtins.diagnostics.vint,
                        -- js
                        null_ls.builtins.diagnostics.eslint,
                    }
                })
            end
        },
    },
}

function M.config()
    require('lspconfig.ui.windows').default_options.border = 'single'
    vim.keymap.set({ 'n', 'v' }, '<leader>rs', ':LspRestart<cr>', { silent = true, noremap = true })
    vim.keymap.set({ 'n', 'v' }, '<leader>st', ':LspStart<cr>', { silent = true, noremap = true })

    -- 要禁用某个 lsp 就去改后缀名
    local lsp_path = vim.fn.stdpath('config') .. '/lua/lsp'
    local file_name_list = vim.fn.readdir(lsp_path)

    for _, the_file_name in pairs(file_name_list) do
        if string.sub(the_file_name, #the_file_name - 3) == '.lua' then
            local lsp_name = string.sub(the_file_name, 1, #the_file_name - 4)
            local lsp = require 'lsp.config.nvim-lsp-conf'

            require 'lspconfig'[lsp_name].setup {
                capabilities = lsp.capabilities,
                on_attach = lsp.on_attach,
                flags = lsp.lsp_flags,
                settings = require('lsp.' .. lsp_name),
            }
        end
    end
end

return M
