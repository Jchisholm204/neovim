return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/nvim-cmp',
    },
    config = function()
        -- base mason setup
        require("mason").setup{
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
        -- completion plugin cmp
        local cmp = require('cmp')
        cmp.setup({
            completion = {
                completeopt = 'noselect',
            },
            preselect = cmp.PreselectMode.None,
            mapping = {
                -- Navigate between completion item
                ['<Tab>'] = cmp.mapping.select_next_item(),

                -- Confirm item
                ['<Enter>'] = cmp.mapping.confirm({select = true}),
            }
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                -- Replace these with whatever servers you want to install
                'rust_analyzer',
                'clangd'
            },
        })

        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = lsp_capabilities,
                })
            end,
        })


    end
}
