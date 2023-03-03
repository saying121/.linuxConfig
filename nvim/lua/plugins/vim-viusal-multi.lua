return {
    'mg979/vim-visual-multi',
    branch = 'master',
    keys={
        [[\\\]],
    },
    config = function()
        -- vim.cmd [[ hi VM_Cursor guibg=blue ctermbg=blue guifg=blue ctermfg=blue gui=italic ]]
        -- vim.cmd [[ hi VM_Insert guibg=blue ctermbg=blue guifg=blue ctermfg=blue gui=italic ]]
        -- vim.cmd [[ hi VM_Extend guibg=blue ctermbg=blue guifg=blue ctermfg=blue gui=italic ]]
        vim.cmd [[ hi VM_Mono guibg=blue ctermbg=blue guifg=blue ctermfg=blue gui=italic ]]
        vim.cmd [[ hi MultiCursor guibg=blue ctermbg=blue guifg=blue ctermfg=blue gui=italic ]]
    end
}
