return {
  "lervag/vimtex",
  lazy = false, -- vimtex should never be lazy-loaded
  init = function()
    -- These must be set BEFORE vimtex loads
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_quickfix_mode = 0
  end,
}
