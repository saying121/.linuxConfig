local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
    },
    config = function()

        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "bash", "c", "java", "lua", "python", "vim",
            },
            sync_install = true,
            auto_install = true,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<BS>",
                    node_decremental = "<C-b>"
                }
            },
            indent = {
                enable = false
            },
            highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                -- disable = { "c", "rust" },

                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                ---@diagnostic disable-next-line: unused-local
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        }

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter', 'BufWritePost' }, {
            -- pattern = { '*.py', '*.sh' },
            group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
            callback = function()
                vim.opt.foldmethod = 'expr'
                vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
                vim.cmd [[normal zR]]
            end
        })

    end
}

return M
