-- lua/plugins/strudel.lua
return {
    "gruvw/strudel.nvim",
    build = "npm install",
    config = function()
        require("strudel").setup({
        })
    end,
}
