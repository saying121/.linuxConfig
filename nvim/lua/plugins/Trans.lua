return {
    "JuanZoran/Trans.nvim",
    keys = {
        { 'mm', mode = { 'n', 'x' } },
        { 'mk', mode = { 'n', 'x' } },
        { 'mi', mode = { 'n', } },
    },
    build = 'bash ./install.sh',
    dependencies = {
        'kkharji/sqlite.lua'
    },
    config = function()
        local opts = { noremap = true, silent = true }
        vim.keymap.set({ 'n', 'x' }, 'mm', ':Translate<CR>', opts)
        vim.keymap.set({ 'n', 'x' }, 'mk', ':TransPlay<CR>', opts)
        vim.keymap.set('n', 'mi', '<Cmd>TranslateInput<CR>', opts)
        require 'Trans'.setup {
            view = {
                i = 'float',
                n = 'hover',
                v = 'hover',
            },
            hover = {
                width = 37,
                height = 27,
                border = 'rounded',
                -- title = title,
                keymap = {
                    pageup = '[[',
                    pagedown = ']]',
                    pin = '<leader>[',
                    close = '<leader>]',
                    toggle_entry = "<leader>'",
                    play = '_',
                },
                animation = {
                    open = 'fold',
                    close = 'fold',
                    -- open = 'slid',
                    -- close = 'slid',
                    interval = 0,
                },
                auto_close_events = {
                    'InsertEnter',
                    'CursorMoved',
                    'BufLeave',
                },
                auto_play = true,
                timeout = 3000,
                -- spinner = 'dots', -- 查看所有样式: /lua/Trans/util/spinner
                spinner = 'moon'
            },
            float = {
                width = 0.8,
                height = 0.8,
                border = 'rounded',
                -- title = title,
                keymap = {
                    quit = 'q',
                },
                animation = {
                    open = 'fold',
                    close = 'fold',
                    interval = 10,
                },
                tag = {
                    wait = '#519aba',
                    fail = '#e46876',
                    success = '#10b981',
                },
                engine = {
                    '本地',
                }
            },
            order = { -- only work on hover mode
                'title',
                'tag',
                'pos',
                'exchange',
                'translation',
                'definition',
            },
            icon = {
                star = '',
                notfound = ' ',
                yes = '✔',
                no = '',
                -- --- char: ■ | □ | ▇ | ▏ ▎ ▍ ▌ ▋ ▊ ▉ █
                -- --- ◖■■■■■■■◗▫◻ ▆ ▆ ▇⃞ ▉⃞
                cell = '■',
                -- star = '⭐',
                -- notfound = '❔',
                -- yes = '✔️',
                -- no = '❌'
            },
            -- theme = 'default',
            theme = 'dracula',
            -- theme = 'tokyonight',

            db_path = '$HOME/.vim/dict/ultimate.db',

            engine = {
                -- baidu = {
                --     appid = '',
                --     appPasswd = '',
                -- },
                -- -- youdao = {
                --     appkey = '',
                --     appPasswd = '',
                -- },
            },

            -- TODO :
            -- register word
            -- history = {
            --     -- TOOD
            -- }

            -- TODO :add online translate engine
        }
    end
}