local dash = vim.fn.stdpath('config') .. '/dashboard'
local db = require('dashboard')

if os.execute('grep -c kali /etc/os-release > /dev/null') then
    prev = 'kali'
    db.preview_file_height = 20
    db.preview_file_width = 70
    db.preview_command = 'cat|lolcat -F 0.3'
elseif os.execute('grep -c arch /etc/os-release > /dev/null') then
    prev = 'arch'
    db.preview_file_height = 20
    db.preview_file_width = 39
    db.preview_command = 'cat|lolcat -F 0.3'
else
    prev = 'pegasus_symbol'
    db.preview_command = 'cat|lolcat -F 0.3'
    db.preview_file_height = 20
    db.preview_file_width = 70
end


db.preview_file_path = dash .. '/' .. prev .. '.cat'
-- if
-- db.preview_file_path = dash .. '/arnor-lucy3.jpg'
-- db.preview_command = 'ueberzug'
-- db.preview_command = 'kitty +kitten icat'

pcall(vim.cmd [[
function! Rain()
    exec ':CellularAutomaton game_of_life'
    normal i<esc>
endfunction
]])
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
