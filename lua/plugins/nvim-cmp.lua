return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        -- 'hrsh7th/cmp-cmdline',
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        -- loads vscode style snippets from installed plugins
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = 'preview,noselect',
            },
            -- Disable preselecting autocomplete - I will press tab when I want it
            preselect = cmp.PreselectMode.None,
            -- completion mappings
            mapping = {
                -- Navigate between completion item
                ['<Tab>'] = cmp.mapping.select_next_item(),

                -- Confirm item
                ['<Enter>'] = cmp.mapping.confirm({select = true}),
            },
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp"},
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
            }),
        })
    end
}

