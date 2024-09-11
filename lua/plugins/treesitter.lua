-- treesitter.lua
return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate', -- Automatically update parsers on install
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "cpp", "lua", "python", "c" }, -- Minimal set of languages
            highlight = {
                enable = true, -- Enable syntax highlighting
            },
        }
    end,
}

