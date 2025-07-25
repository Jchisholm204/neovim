return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local lspconfig = require('lspconfig')

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- mason_lspconfig.setup({
        --     ensure_installed = {
        --         'lua_ls',
        --         -- C/C++ Language Servers
        --         'clangd',
        --         -- 'cmake',
        --         -- 'arduino_language_server',
        --         -- Rust
        --         -- 'rust_analyzer',
        --         -- Bash
        --         'bashls',
        --         -- Assembly Language LSP
        --         -- 'asm_lsp',
        --         -- Latex LSP
        --         'ltex',
        --         -- 'bufls',
        --         -- VHDL/Verilog/SystemVerilog LSP
        --         -- 'hdl_checker',
        --         -- Python LSP
        --         -- 'pylsp',
        --         -- 'gh_actions',
        --         'svls',
        --     },
        --     -- You can disable automatic installation if you want:
        --     -- automatic_installation = true,
        -- })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Setup servers individually
        local servers = {
            'lua_ls',
            'clangd',
            'bashls',
            'ltex',
            'pylsp',
            'cmake',
            -- Add more servers here if you uncomment them above
        }

        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
            })
        end

        -- Custom setup for svls
        lspconfig.svls.setup({
            capabilities = capabilities,
            filetypes = { "verilog", "systemverilog" },
            cmd = {"svls"},
            root_dir = lspconfig.util.root_pattern(".git", "hdl", ".", ".svproject"),
        })

        lspconfig.svlangserver.setup({
            cmd = { "svlangserver", "--stdio" },
            filetypes = { "verilog", "systemverilog" },
            root_dir = lspconfig.util.root_pattern(".git", "."),
            capabilities = capabilities,
            init_options = {
                includeIndexing = {"**/*.sv", "**/*.v", "**/*.svh"}
            }
        })

        lspconfig.verible.setup({
            cmd = { "verible-verilog-ls", "--rules_config_search" },
            filetypes = { "verilog", "systemverilog" },
            root_dir = lspconfig.util.root_pattern(".git", "verilator.f"),
            -- format_on_save = true,
        })

        -- require'plugins.lsp.setup_systemverilog'.setupLsp()

        vim.diagnostic.config({
            update_in_insert = true,
        })
    end,
}

