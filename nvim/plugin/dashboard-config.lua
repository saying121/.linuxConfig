local footer1 = {
    [[..............................................................................]],
    [[..............................................................................]],
    [[..............................................................................]],
    [[.........=@@@@@@()..............................................*(())@@^......]],
    [[.....,@@@@@@@@@@@@@@@O(....................................,)/@@@@@@@@@@@@|...]],
    [[...,@@@@@@@@@@/...\@@@@O.................................=O@@@@/||@@@@@@@@@@@`]],
    [[....@@@OO@@@@@\`.,/@@@@@@*..............................=@@@@@\...,@@@@@OO@@@`]],
    [[.....\@^.=@@@@@@@@@@@@@*\........*.............*........O/@@@@@@@@@@@@@@.,@@`.]],
    [[.......,`.\@@@@OOO@@@@/.*.......=@\`*(OO\@\`*)@@........,.@@@@@@@@@@@@@`.=`...]],
    [[.........,oO@OOOOOO@@@/...........,||*.....,||*..........*`@@@OooooO@@|/`.....]],
    [[.............*.....*.......................................*|||||||||`........]],
    [[..............................................................................]],
}

local dashpath = vim.fn.stdpath('config') .. '/dashboard'
local dbtable = {
    -- { path = dashpath .. '/tuzi.png', command = 'ueberzug', height = 20, width = 60 },
    -- { path = dashpath .. '/lucy.jpg', command = 'ueberzug', height = 20, width = 24 },
    { path = dashpath .. '/arch.cat', command = 'cat | lolcat -F 0.3', height = 20, width = 39 },
    { path = dashpath .. '/kali.cat', command = 'cat | lolcat -F 0.3', height = 20, width = 70 },
}
-- lua5.1随机数有bug,用viml实现
local rand = vim.api.nvim_eval('rand()') % #dbtable + 1
-- local rand = math.random(1, #dbtable)
require 'dashboard'.setup({
    theme = 'doom',
    preview = {
        command = dbtable[rand]['command'],
        file_path = dbtable[rand]['path'],
        file_height = dbtable[rand]['height'],
        file_width = dbtable[rand]['width'],
    },
    config = {
        header = '',
        week_header = {
            enable = true,
            concat = '',
            append = '',
        },
        disable_move = true,
        center = {
            { icon = '  ', icon_hl = 'group', desc = 'Recently opened files       ', desc_hl = 'group', key = '|',
                key_hl = '', action = 'Telescope oldfiles' },
            { icon = '  ', icon_hl = 'group', desc = 'File Browser                ', desc_hl = 'group', key = '|',
                key_hl = '', action = 'FloatermNew --height=0.8 --width=0.8 ranger' },
            { icon = '  ', icon_hl = 'group', desc = 'Edit config                 ', desc_hl = 'group', key = '|',
                key_hl = '', action = 'e $MYVIMRC' },
            { icon = '  ', icon_hl = 'group', desc = 'Exit                        ', desc_hl = 'group', key = '|',
                key_hl = '', action = 'q' }
        },
        -- footer = footer2,
    }

    -- { icon = '  ', desc = 'Recently lastest session    ', shortcut = '|', action = 'SessionLoad' },
    -- { icon = '  ', desc = 'Find File                   ', shortcut = '|',
    --     action = 'Telescope find_files find_command=rg,--hidden,--files' },
})
