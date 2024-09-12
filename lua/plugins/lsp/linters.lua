-- Linters (Code Formatters)
return {
    'jay-babu/mason-null-ls.nvim',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        local nullls = require('mason-null-ls')
        nullls.setup({
            ensure_installed = {
                -- NOTE: this plugin requres the host to have python3.10-venv installed
                'codespell',
                'cspell'
            }
        })
    end,
}
