local db = require('dashboard')
db.hide_statusline=true

local dash = vim.fn.stdpath('config') .. '/dashboard'
local dbtable = {
    { path = dash .. '/tuzi.png', command = 'ueberzug', height = 20, width = 60 },
    { path = dash .. '/lucy.jpg', command = 'ueberzug', height = 20, width = 24 },
    { path = dash .. '/arch.cat', command = 'cat | lolcat -F 0.3', height = 20, width = 39 },
    { path = dash .. '/kali.cat', command = 'cat | lolcat -F 0.3', height = 20, width = 70 },
}

-- lua5.1随机数有bug,用viml实现
-- 0 到 dbtable长度-1的随机数;lua 从1索引再加1
-- local rand = math.random(1,#dbtable)
local rand = vim.api.nvim_eval('rand()') % #dbtable + 1
-- local rand = math.random(1, #dbtable)
db.preview_file_path = dbtable[rand]['path']
db.preview_command = dbtable[rand]['command']
db.preview_file_height = dbtable[rand]['height']
db.preview_file_width = dbtable[rand]['width']

--   --
db.custom_center = {
    -- { icon = '   ', desc = '                            ', shortcut = '', action = '' },
    -- { icon = '  ', desc = 'Recently lastest session    ', shortcut = '|', action = 'SessionLoad' },
    { icon = '  ', desc = 'Recently opened files       ', shortcut = '|', action = 'Telescope oldfiles' },
    -- { icon = '  ', desc = 'Find File                   ', shortcut = '|',
    --     action = 'Telescope find_files find_command=rg,--hidden,--files' },
    -- { icon = '  ', desc = 'Find Word                   ', shortcut = '|', action = 'Telescope live_grep' },
    { icon = '  ', desc = 'File Browser                ', shortcut = '|',
        action = 'FloatermNew --height=0.8 --width=0.8 ranger' },
    { icon = '  ', desc = 'Edit config                 ', shortcut = '|', action = 'e $MYVIMRC' },
    { icon = '  ', desc = 'Exit                        ', shortcut = '|', action = 'q' },
}

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

-- db.custom_footer = footer1
