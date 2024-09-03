-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Search
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    -- Syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },
    'nvim-treesitter/playground',
    -- File Jumper (Super usefull)
    'theprimeagen/harpoon',
    -- Autopair brackets plugin
    'windwp/nvim-autopairs',
    -- Doxygen Comment
    {
        "danymat/neogen",
	    dependencies = "nvim-treesitter/nvim-treesitter",
    },
    -- Code alignment plugin
    'junegunn/vim-easy-align',
    -- Bottom bar plugin
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    -- Block comment plugin
        'numToStr/Comment.nvim'

}

local opts = {}

require("lazy").setup(plugins, opts)
