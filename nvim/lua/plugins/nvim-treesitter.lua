local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        -- 'p00f/nvim-ts-rainbow',
    },
    config = function()

        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "bash", "c", "html", "java", "javascript", "json", "lua", "python", "sql", "vim", "markdown"
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
                -- enable = true
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
            rainbow = {
                enable = false,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            }
        }

        -- vim.opt.foldmethod     = 'expr'
        -- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
        ---WORKAROUND
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
            group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
            callback = function()
                vim.opt.foldmethod = 'expr'
                vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
            end
        })
        ---ENDWORKAROUND

    end
}
return M
