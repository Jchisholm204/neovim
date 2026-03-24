-- lua/plugins/strudel.lua
return {
    "gruvw/strudel.nvim",
    build = "npm install",
    config = function()
        require("strudel").setup({
            ui = {
                -- Maximise the menu panel
                -- (optional, default: true)
                maximise_menu_panel = true,
                -- Hide the Strudel menu panel (and handle)
                -- (optional, default: false)
                hide_menu_panel = false,
                -- Hide the default Strudel top bar (controls)
                -- (optional, default: false)
                hide_top_bar = false,
                -- Hide the Strudel code editor
                -- (optional, default: false)
                hide_code_editor = false,
                -- Hide the Strudel eval error display under the editor
                -- (optional, default: false)
                hide_error_display = false,
            },
            start_on_launch = true,
            sync_cursor = true,
            update_on_save = true,
        })
    end,
}
