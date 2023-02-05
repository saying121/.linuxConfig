return {
    Lua = {
        runtime = {
            version = "LuaJIT",
        },
        completion = {
            callSnippet = "Both"
        },
        diagnostics = {
            globals = {
                'vim',
            },
        },
        workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
            -- maxPreload=2000,
            preloadFileSize = 10000,
        },
        telemetry = {
            enable = false
        },
    }
}
