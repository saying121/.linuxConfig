local M = {
    {
        -- 括号
        'steelsojka/pears.nvim',
        -- 不能设置
        -- lazy = true,
        -- event = 'InsertEnter',
        config = function()
            require 'pears'.setup()
        end
    },
    {
        'numToStr/Comment.nvim',
        keys = {
            { 'gc', mode = { 'n', 'v' } },
            { 'gb', mode = { 'n', 'v' } },
        },
        config = function()
            require 'Comment'.setup()
        end
    },
    {
        'tpope/vim-surround',
        keys = {
            { 'ys', mode = 'n' },
            { 'yS', mode = 'n' },
            { 'ds', mode = 'n' },
            { 'cs', mode = 'n' },
            { 'S', mode = 'v' },
        },
    },
}

return M
