return {
    'jayp0521/mason-null-ls.nvim',
    cmd = 'Mason',
    config = function()
        require 'mason-null-ls'.setup({
            ensure_installed = {
                'black',
                'isort',
                'prettier',
                'shfmt',
                -- 'rustfmt',
                'sql_formatter',
                'vint',
                'vale',
                'shellcheck',
                'beautysh',
                -- 'clang-format',
            },
            automatic_installation = true,
            automatic_setup = false,
        })
    end
}
