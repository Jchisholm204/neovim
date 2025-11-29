return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    opts={
        transparent_background = true,
    },
    config = function()
        require('catppuccin').setup({
            transparent_background = true,
        })
        vim.cmd.colorscheme("catppuccin")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        
        -- Dynamically apply winhighlight to inactive windows
        vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
            callback = function()
                vim.wo.winhighlight = ""
            end
        })

        vim.api.nvim_create_autocmd("WinLeave", {
            callback = function()
                vim.wo.winhighlight = "Normal:NormalNC"
            end
        })

    end
}

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"

