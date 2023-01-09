local dash = vim.fn.stdpath('config') .. '/dashboard'
local db = require('dashboard')

if os.execute('pacman -Qs xorg | grep -c xorg') then
    -- lua5.1随机数有bug
    rand = math.random(1, 2)
    if rand == 1 then
        db.preview_file_path = dash .. '/tuzi.png'
        db.preview_command = 'ueberzug'
        db.preview_file_height = 20
        db.preview_file_width = 60
    end
    if rand == 2 then
        db.preview_file_path = dash .. '/lucy.jpg'
        db.preview_command = 'ueberzug'
        db.preview_file_height = 20
        db.preview_file_width = 24
    end
end
-- elseif os.execute('grep -c arch /etc/os-release > /dev/null') then
--     db.preview_file_path = dash .. '/arch.cat'
--     db.preview_file_height = 20
--     db.preview_file_width = 39
--     db.preview_command = 'cat|lolcat -f 0.3'
-- elseif os.execute('grep -c kali /etc/os-release > /dev/null') then
--     db.preview_file_path = dash .. '/kali.cat'
--     db.preview_file_height = 20
--     db.preview_file_width = 70
--     db.preview_command = 'cat|lolcat -f 0.3'
-- else
--     db.preview_file_path = dash .. '/pegasus_symbol.cat'
--     db.preview_command = 'cat|lolcat -f 0.3'
--     db.preview_file_height = 20
--     db.preview_file_width = 70
-- end

--   --
db.custom_center = {
    -- { icon = '  ', desc = 'Animations                  ', shortcut = '|', action = 'call Rain()' },
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
