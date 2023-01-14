LspInfos = {}
function LspInfos.getlsp()
    for i = 1, #vim.lsp.get_active_clients(), 1 do
        print(vim.lsp.get_active_clients()[i]['name'])
    end
    -- return vim.lsp.get_active_clients()[1]['name']
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>ls', ':lua LspInfos.getlsp()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ll', ':lua =vim.lsp.get_active_clients()<CR>', opts)
