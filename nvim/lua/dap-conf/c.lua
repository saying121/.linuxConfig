local dap = require 'dap'
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb',
}
dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        runInTerminal = true,
    },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = dap.configurations.cpp
dap.configurations.rust[1]['program'] = function()
    local git_root = io.popen("git rev-parse --show-toplevel") -- 执行命令
    local the_root = git_root:read("*a") -- 读取所有输出

    -- if the_root == nil then
    --     print('It\'s not a rust project.')
    --     return ''
    -- else
    --     the_root = git_root:read("*a") -- 读取所有输出
    -- end

    local really_root = string.gsub(the_root, '%s+$', '')
    git_root:close() -- 关闭文件描述符

    return vim.fn.input('Path to executable: ', really_root .. '/target/debug/', 'file')
end
