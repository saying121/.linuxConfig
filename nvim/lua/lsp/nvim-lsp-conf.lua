local M = {}


local signs = {
    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn", text = " " },
    { name = "DiagnosticSignHint", text = " " },
    { name = "DiagnosticSignInfo", text = " " },
}
for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>g", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- 换到telescope
-- vim.keymap.set('n', '<space>ll', vim.diagnostic.setloclist, opts)
-- 边框
local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
    border = _border
}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
    border = _border
}
)

vim.diagnostic.config({
    virtual_text = false,
    -- signs = {
    --     active = signs,
    -- },
    update_in_insert = true,
    underling = true,
    float = { border = "single" }
})
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<M-cr>", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format { async = true }
    end, bufopts)
    vim.keymap.set("v", "<space>f", vim.lsp.buf.range_formatting, bufopts)

    -- Find the clients capabilities
    local cap = client.server_capabilities
    -- Only highlight if compatible with the language
    if cap.documentHighlightProvider then
        vim.cmd('augroup LspHighlight')
        vim.cmd('autocmd!')
        vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
        -- vim.cmd('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
        vim.cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
        vim.cmd('augroup END')
    end
end

M.lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
M.capabilities = require('cmp_nvim_lsp').default_capabilities()

return M
