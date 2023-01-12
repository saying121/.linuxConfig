-- lua =vim.lsp.get_active_clients()
Statusline = {}
function Statusline.getlsp()
    for i = 1, #vim.lsp.get_active_clients(), 1 do
        print(vim.lsp.get_active_clients()[i]['name'])
    end
    -- return vim.lsp.get_active_clients()[1]['name']
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>ll', ':lua Statusline.getlsp()<CR>', opts)
