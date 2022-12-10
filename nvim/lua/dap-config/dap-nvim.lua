vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
-- vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })

local dap = require 'dap'
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>B', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
vim.keymap.set('n', '<space>b', dap.toggle_breakpoint, opts)

vim.keymap.set('n', '<F5>', dap.continue, opts)
vim.keymap.set('n', '<F6>', dap.step_over, opts)
vim.keymap.set('n', '<F7>', dap.step_into, opts)
vim.keymap.set('n', '<F8>', dap.step_out, opts)

vim.keymap.set("n", "<F9>", dap.terminate, opts)

vim.keymap.set('n', '<space>lp',
    "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
vim.keymap.set('n', '<space>dr', dap.repl.open, opts)
vim.keymap.set('n', '<space>dl', dap.run_last, opts)

-- 自动开启ui
local function config_dapui()
    -- dapui config
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        vim.api.nvim_command("DapVirtualTextEnable")
        --dapui.close("tray")
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextEnable")
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextEnable")
        dapui.close()
    end
    dap.listeners.before.disconnect["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextEnable")
        dapui.close()
    end
    -- TODO wait dap-ui for fix terminal layout
    -- the "30" of "30vsplit: doesn't work
    dap.defaults.fallback.terminal_win_cmd = '30vsplit new' -- this will be override by dapui
end
