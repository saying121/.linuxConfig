require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "python",
        "sql",
        "vim",
        "markdown"
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
pcall(vim.cmd, [[
    " 代码折叠
    function FoldConfig()
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
    endfunction
    autocmd BufAdd,BufEnter,BufNewFile,BufWinEnter * :call FoldConfig()
]])
