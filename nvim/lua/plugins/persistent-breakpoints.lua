local M = {
    'Weissle/persistent-breakpoints.nvim',
    keys = {
        { '<space>b', mode = 'n' },
        { '<space>B', mode = 'n' },
        { '<leader>tb', mode = 'n' },
        { '<leader>cb', mode = 'n' },
        { '<leader>cl', mode = 'n' },
    },
    cmd = {
        'PBToggleBreakpoint',
        'PBClearAllBreakpoints',
        'PBSetConditionalBreakpoint',
    },
    config = function()

        require('persistent-breakpoints').setup {
            save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
            load_breakpoints_event = { "BufReadPost" },
            -- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
            perf_record = false,
        }
        local opts = { noremap = true, silent = true }
        local keymap = vim.api.nvim_set_keymap
        -- Save breakpoints to file automatically.
        keymap("n", "<leader>tb", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
        keymap("n", "<leader>cb", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", opts)
        keymap("n", "<leader>cl", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)
    end,
}
return M