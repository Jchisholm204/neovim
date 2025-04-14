vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
-- Jump to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- use spaces instead of tabs
vim.o.expandtab = true
-- set the number of spaces used per tab
vim.o.tabstop = 4
vim.o.shiftwidth = 4
-- Enable Line Numbers
vim.o.number = true

vim.api.nvim_create_user_command("CHeader", function()
  local filename = vim.fn.expand("%:t")
  local date = os.date("%Y-%m-%d")
  local year = os.date("%Y")
  local lines = {
    "/**",
    " * @file " .. filename,
    " * @author Jacob Chisholm (https://Jchisholm204.github.io)",
    " * @brief ",
    " * @version 0.1",
    " * @date Created: " .. date,
    " * @modified Last Modified: " .. date,
    " *",
    " * @copyright Copyright (c) " .. year,
    " */",
    ""
  }
  vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
end, {})


vim.api.nvim_create_user_command("UpdateCHeader", function()
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local date = os.date("%Y-%m-%d")

  for idx, line in ipairs(lines) do
    -- update @modified
    if line:match("@modified") then
      lines[idx] = line:gsub("@modified.*", "@modified Last Modified: " .. date)
    end
    -- optionally bump version
    if line:match("@version") then
      local major, minor = line:match("(%d+)%.(%d+)")
      if major and minor then
        minor = tonumber(minor) + 1
        lines[idx] = line:gsub("@version.*", "@version " .. major .. "." .. minor)
      end
    end
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end, {})

