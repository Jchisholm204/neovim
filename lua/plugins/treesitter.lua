return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  lazy = false, 
  priority = 1000,
  cmd = {"TSUpdate", "TSInstall"},
  config = function()
      require'nvim-treesitter.configs'.setup {
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
