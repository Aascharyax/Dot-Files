-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- VS Code-style bottom terminal
local terminal_buf = nil
local terminal_win = nil

vim.keymap.set("n", "<C-_>", function()
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
    return
  end

  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.cmd("botright 12split")
    terminal_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
  else
    vim.cmd("botright 12split")
    vim.cmd("terminal fish --no-config")
    terminal_win = vim.api.nvim_get_current_win()
    terminal_buf = vim.api.nvim_get_current_buf()
  end

  vim.cmd("startinsert")
end, { desc = "Toggle integrated terminal" })

-- Transparent terminal and floating backgrounds
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
