return {
    "tpope/vim-dadbod",
    dependencies = {
        require("plugins.database.vim-dadbd-completion"),
        {
            "kristijanhusak/vim-dadbod-ui",
            config = function()
                vim.g.db_ui_icons = {
                    expanded = {
                        db = "▾ ",
                        buffers = "▾ ",
                        saved_queries = "▾ ",
                        schemas = "▾ ",
                        schema = "▾ פּ",
                        tables = "▾ 藺",
                        table = "▾ ",
                    },
                    collapsed = {
                        db = "▸ ",
                        buffers = "▸ ",
                        saved_queries = "▸ ",
                        schemas = "▸ ",
                        schema = "▸ פּ",
                        tables = "▸ 藺",
                        table = "▸ ",
                    },
                    saved_query = "",
                    new_query = "璘",
                    tables = "離",
                    buffers = "﬘",
                    add_connection = "",
                    connection_ok = "✓",
                    connection_error = "✕",
                }
            end,
        },
    },
    config = function()
        -- vim.g.db_ui_force_echo_notifications = 1
    end,
}
