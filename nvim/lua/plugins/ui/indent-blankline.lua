return {
    "lukas-reineke/indent-blankline.nvim",
    event = "CursorMoved ",
    config = function()
        -- vim.cmd [[hi IndentBlanklineIndent1 guibg=#9D7CD8 guifg=#9D7CD8]]
        require("indent_blankline").setup({
            space_char_blankline = " ",
            show_current_context = true,
            -- show_current_context_start = true,
        })
    end,
}
