local M = {
    'voldikss/vim-floaterm',
    lazy = true,
    keys = {
        { '<space>tt', ':FloatermNew --height=0.8 --width=0.8<CR>', mode = 'n', desc = 'floaterm' },
        { '<space>tr', ':FloatermNew --height=0.8 --width=0.8 ranger<CR>', mode = 'n', desc = 'float ranger' },
    },
    ft = 'dashboard',
}
function M.config()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n','<space>h',':FloatermToggle',opts)
    vim.api.nvim_set_keymap('n','<space>k',':FloatermKill',opts)
end

return M
