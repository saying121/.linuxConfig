return {
    "glepnir/lspsaga.nvim",
    event = "BufReadPre",
    config = function()
        require("lspsaga").setup({
            symbol_in_winbar = {
                enable = false,
                separator = " ",
                hide_keyword = true,
                show_file = true,
                folder_level = 2,
                respect_root = false,
                color_mode = true,
            },
            finder = {
                jump_to = 'p',
                edit = { "o", "<CR>" },
                vsplit = "s",
                split = "i",
                tabe = "t",
                quit = { "q", "<ESC>" },
            },
            definition = {
                edit = "<C-c>o",
                vsplit = "<C-c>v",
                split = "<C-c>i",
                tabe = "<C-c>t",
                quit = "q",
                close = "<Esc>",
            },
            code_action = {
                num_shortcut = true,
                keys = {
                    -- string | table type
                    quit = "q",
                    exec = "<CR>",
                },
            },
            lightbulb = {
                enable = true,
                enable_in_insert = true,
                sign = true,
                sign_priority = 40,
                virtual_text = true,
            },
            diagnostic = {
                show_code_action = true,
                show_source = true,
                jump_num_shortcut = true,
                --1 is max
                max_width = 0.7,
                custom_fix = nil,
                custom_msg = nil,
                text_hl_follow = false,
                keys = {
                    exec_action = "o",
                    quit = "q",
                    go_action = "g"
                },
            },
            rename = {
                quit = "<C-c>",
                exec = "<CR>",
                mark = "x",
                confirm = "<CR>",
                in_select = true,
            },
            outline = {
                win_position = "right",
                win_with = "",
                win_width = 30,
                show_detail = true,
                auto_preview = true,
                auto_refresh = true,
                auto_close = true,
                custom_sort = nil,
                keys = {
                    jump = "o",
                    expand_collapse = "u",
                    quit = "q",
                },
            },
            callhierarchy = {
                show_detail = false,
                keys = {
                    edit = "e",
                    vsplit = "s",
                    split = "i",
                    tabe = "t",
                    jump = "o",
                    quit = "q",
                    expand_collapse = "u",
                },
            },

        })
        -- vim.wo.winbar /
        vim.wo.stl = require('lspsaga.symbolwinbar'):get_winbar()
        local keymap = vim.keymap.set

        -- LSP finder - Find the symbol's definition
        -- If there is no definition, it will instead be hidden
        -- When you use an action in finder like "open vsplit",
        -- you can use <C-t> to jump back
        keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

        -- Code action
        keymap({ "n", "v" }, "<M-cr>", "<cmd>Lspsaga code_action<CR>")

        -- Rename all occurrences of the hovered word for the entire file
        keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>")

        -- Rename all occurrences of the hovered word for the selected files
        keymap("n", "<space>Rn", "<cmd>Lspsaga rename ++project<CR>")

        -- Peek definition
        -- You can edit the file containing the definition in the floating window
        -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
        -- It also supports tagstack
        -- Use <C-t> to jump back
        keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>")

        -- Go to definition
        keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

        -- Show line diagnostics
        -- You can pass argument ++unfocus to
        -- unfocus the show_line_diagnostics floating window
        keymap("n", "<space>g", "<cmd>Lspsaga show_line_diagnostics<CR>")

        -- Show cursor diagnostics
        -- Like show_line_diagnostics, it supports passing the ++unfocus argument
        keymap("n", "<space>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

        -- Show buffer diagnostics
        keymap("n", "<space>ll", "<cmd>Lspsaga show_buf_diagnostics<CR>")

        -- Diagnostic jump
        keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
        keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")

        -- Diagnostic jump with filters such as only jumping to an error
        keymap("n", "[e", function()
            require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end)
        keymap("n", "]e", function()
            require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end)

        keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

        -- Hover Doc
        -- If there is no hover doc,
        -- there will be a notification stating that
        -- there is no information available.
        -- To disable it just use ":Lspsaga hover_doc ++quiet"
        -- Pressing the key twice will enter the hover window
        keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

        -- If you want to keep the hover window in the top right hand corner,
        -- you can pass the ++keep argument
        -- Note that if you use hover with ++keep, pressing this key again will
        -- close the hover window. If you want to jump to the hover window
        -- you should use the wincmd command "<C-w>w"
        keymap("n", "zk", "<cmd>Lspsaga hover_doc ++keep<CR>")

        -- Call hierarchy
        keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
        keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

        keymap({ "n", "t" }, "<A-a>", "<cmd>Lspsaga term_toggle<CR>")
    end,
}
