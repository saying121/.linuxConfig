return {
    'rcarriga/cmp-dap',
    -- keys = {
    --     { '<space>b',   mode = 'n' },
    --     { '<space>B',   mode = 'n' },
    --     { '<leader>tb', mode = 'n' },
    --     { '<leader>sc', mode = 'n' },
    --     { '<leader>cl', mode = 'n' },
    -- },
    keys = require('plugins.daps.the_keys'),
    ft = { 'dap-repl', 'dapui_watches', 'dapui_hover' },
    config = function()
        require("cmp").setup({
            enabled = function()
                return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                    or require("cmp_dap").is_dap_buffer()
            end
        })

        require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
            sources = {
                { name = "dap" },
            },
        })
    end
}
