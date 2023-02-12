return {
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
}
