local git_root = io.popen("git rev-parse --show-toplevel") -- 执行命令
---@diagnostic disable-next-line: need-check-nil
local the_root = git_root:read("*a") -- 读取所有输出
local really_root = string.gsub(the_root, '%s+$', '')
---@diagnostic disable-next-line: need-check-nil
git_root:close() -- 关闭文件描述符
-- 打开Cargo.toml文件
vim.keymap.set('n', '<c-o>', function()
    vim.api.nvim_command('tabnew ' .. really_root .. '/Cargo.toml')
end,
    { noremap = true, silent = true })
