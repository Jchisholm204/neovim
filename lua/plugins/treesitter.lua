return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  lazy = false, 
  priority = 1000,
  cmd = {"TSUpdate", "TSInstall"},
  opts_extend = { "ensure_installed" },
  opts = {
    -- highlight = { enable = true },
    -- indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "lua",
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
