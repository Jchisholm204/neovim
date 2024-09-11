return {
    'nvim-treesitter/nvim-treesitter',
    cmd = {'TSUpdate', 'TSInstall'},
    build = ':TSUpdate',
    lazy = false,
    branch = 'main',
    config = function()

        require('nvim-treesitter.configs').setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim" },

            sync_install = false,

            auto_install = true,


            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
