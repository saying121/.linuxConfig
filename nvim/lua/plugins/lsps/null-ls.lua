return {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
        "angular",
        "css",
        "flow",
        "graphql",
        "html",
        "javascript",
        "json",
        "jsx",
        "less",
        "markdown",
        "python",
        "scss",
        "sh",
        "sql",
        "mysql",
        "plsql",
        "dbui",
        "typescript",
        "vim",
        "vue",
        "yaml",
        "tex",
        "asciidoc",
        "rust",
        "lua",
        "zsh",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local sources_table = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.isort,

            null_ls.builtins.formatting.sql_formatter,
            null_ls.builtins.formatting.json_tool,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.stylua,
            -- viml
            null_ls.builtins.diagnostics.vint,
            null_ls.builtins.diagnostics.pylint,
            null_ls.builtins.diagnostics.vale,
            null_ls.builtins.diagnostics.zsh,
            -- js
            null_ls.builtins.diagnostics.eslint,
        }
        if vim.o.filetype == "zsh" then
            table.insert(sources_table, null_ls.builtins.formatting.beautysh)
            else
            table.insert(sources_table, null_ls.builtins.formatting.shfmt)
        end
        null_ls.setup({
            sources = sources_table,
        })
    end,
}
