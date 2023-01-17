local M = {
    'mfussenegger/nvim-dap',
    lazy = true,
    keys = {
        { '<space>b', mode = 'n' },
        { '<space>B', mode = 'n' },
        { '<leader>tb', mode = 'n' },
        { '<leader>sc', mode = 'n' },
        { '<leader>cl', mode = 'n' },
    },
    cmd = {
        'PBToggleBreakpoint',
        'PBClearAllBreakpoints',
        'PBSetConditionalBreakpoint',
    },
    config = function()
        -- 对各个语言的配置
        require 'dap-conf.python'

        vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })

        local dap, dapui = require("dap"), require("dapui")
        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set

        keymap('n', '<space>b', dap.toggle_breakpoint, opts)
        keymap('n', '<space>B', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)

        keymap({ 'n', 'i', 't' }, '<F5>', dap.continue, opts)
        keymap({ 'n', 'i', 't' }, '<F6>', dap.step_into, opts)
        keymap({ 'n', 'i', 't' }, '<F7>', dap.step_over, opts)
        keymap({ 'n', 'i', 't' }, '<F8>', dap.step_out, opts)
        keymap({ 'n', 'i', 't' }, '<F9>', dap.step_back, opts)
        keymap({ 'n', 'i', 't' }, '<F10>', dap.run_last, opts)
        keymap({ 'n', 'i', 't' }, "<F11>", dap.terminate, opts)

        keymap('n', '<space>lp',
            "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
        keymap('n', '<space>dr', dap.repl.open, opts)
        keymap('n', '<space>dl', dap.run_last, opts)

        -- dapui config
        -- 自动开启ui
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
            vim.api.nvim_command("DapVirtualTextEnable")
            --dapui.close("tray")
        end
        -- 自动关闭ui
        dap.listeners.before.event_terminated["dapui_config"] = function()
            vim.api.nvim_command("DapVirtualTextEnable")
            -- dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            vim.api.nvim_command("DapVirtualTextEnable")
            -- dapui.close()
        end
        dap.listeners.before.disconnect["dapui_config"] = function()
            vim.api.nvim_command("DapVirtualTextEnable")
            -- dapui.close()
        end
        -- TODO wait dap-ui for fix terminal layout
        dap.defaults.fallback.terminal_win_cmd = '30vsplit new' -- this will be override by dapui
        dap.defaults.python.terminal_win_cmd = 'set splitright | 50vsplit new'
        dap.defaults.fallback.focus_terminal = false
        dap.defaults.fallback.force_external_terminal = false

    end,
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            config = function()

                local opts = { noremap = true, silent = true }
                local dapui = require 'dapui'
                local keymap = vim.keymap.set
                keymap('v', '<space>e', dapui.eval, opts)
                keymap('n', '<space>e', dapui.eval, opts)

                keymap({ 'n', 't' }, '<space>dt', dapui.toggle, opts)

                require("dapui").setup({
                    mappings = {
                        -- Use a table to apply multiple mappings
                        expand = { "<CR>", "<2-LeftMouse>" },
                        open = "o",
                        remove = "d",
                        edit = "e",
                        repl = "r",
                        toggle = "t",
                    },
                    -- Use this to override mappings for specific elements
                    element_mappings = {
                        -- Example:
                        -- stacks = {
                        --   open = "<CR>",
                        --   expand = "o",
                        -- }
                    },
                    -- Expand lines larger than the window
                    -- Requires >= 0.7
                    expand_lines = vim.fn.has("nvim-0.7") == 1,
                    -- Layouts define sections of the screen to place windows.
                    -- The position can be "left", "right", "top" or "bottom".
                    -- The size specifies the height/width depending on position. It can be an Int
                    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
                    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
                    -- Elements are the elements shown in the layout (in order).
                    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
                    layouts = {
                        {
                            elements = {
                                -- Elements can be strings or table with id and size keys.
                                { id = "scopes", size = 0.25 },
                                "breakpoints",
                                "stacks",
                                "watches",
                            },
                            size = 40, -- 40 columns
                            position = "left",
                        },
                        {
                            elements = {
                                "repl",
                                -- "console",
                                -- "dap-terminal",
                            },
                            size = 0.25, -- 25% falseof total lines
                            position = "bottom",
                        },
                    },
                    controls = {
                        -- Requires Neovim nightly (or 0.8 when released)
                        enabled = true,
                        -- Display controls in this element
                        element = "repl",
                        icons = {
                            pause = "",
                            play = "",
                            step_into = "",
                            step_over = "",
                            step_out = "",
                            step_back = "",
                            run_last = "",
                            terminate = "",
                        },
                    },
                    floating = {
                        max_height = nil, -- These can be integers or a float between 0 and 1.
                        max_width = nil, -- Floats will be treated as percentage of your screen.
                        border = "rounded", -- Border style. Can be "single", "double" or "rounded"
                        mappings = {
                            close = { "q", "<Esc>" },
                        },
                    },
                    windows = { indent = 1 },
                    render = {
                        max_type_length = nil, -- Can be integer or nil.
                        max_value_lines = 100, -- Can be integer or nil.
                    }
                })

            end,
        },
        {
            'theHamsta/nvim-dap-virtual-text',
            config = function()

                require("nvim-dap-virtual-text").setup {
                    enabled = true,
                    enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                    highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                    show_stop_reason = true, -- show stop reason when stopped for exceptions
                    commented = false, -- prefix virtual text with comment string
                    only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
                    all_references = false, -- show virtual text on all all references of the variable (not only definitions)
                    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
                    -- experimental features:
                    virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
                    all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                    virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
                    virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
                    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
                }

            end,
        },
    },
}

return M
