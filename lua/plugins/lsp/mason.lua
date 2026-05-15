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

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                'lua_ls',
                -- C/C++ Language Servers
                'clangd',
                -- 'cmake',
                -- 'arduino_language_server',
                -- Rust
                -- 'rust_analyzer',
                -- Bash
                'bashls',
                -- Assembly Language LSP
                -- 'asm_lsp',
                -- Latex LSP
                'ltex',
                -- 'bufls',
                -- VHDL/Verilog/SystemVerilog LSP
                -- 'hdl_checker',
                -- Python LSP
                -- 'pylsp',
                -- 'gh_actions',
                'svls',
            },
            -- You can disable automatic installation if you want:
            -- automatic_installation = true,
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        -- Custom setup for svls
        vim.lsp.config('svls', {
            capabilities = capabilities,
            filetypes = { "verilog", "systemverilog" },
            cmd = {"svls"},
            root_markers = {".git", "hdl", ".", ".svproject"},
        })

        vim.lsp.config('svlangserver', {
            cmd = { "svlangserver", "--stdio" },
            filetypes = { "verilog", "systemverilog" },
            root_markers = {".git", "hdl", ".", ".svproject"},
            capabilities = capabilities,
            init_options = {
                includeIndexing = {"**/*.sv", "**/*.v", "**/*.svh"}
            }
        })

        vim.lsp.config('verible', {
            cmd = { "verible-verilog-ls", "--rules_config_search" },
            filetypes = { "verilog", "systemverilog" },
            root_markers = {".git", "hdl", ".", "verilator.f"},
            -- format_on_save = true,
        })

        -- require'plugins.lsp.setup_systemverilog'.setupLsp()

        vim.diagnostic.config({
            update_in_insert = true,
        })
    end,
}

