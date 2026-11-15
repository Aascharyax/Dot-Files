
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        shell = "fish --no-config",
        direction = "float",
        start_in_insert = true,
        close_on_exit = true,
        shade_terminals = false,
        float_opts = {
          border = "curved",
          width = function()
            return math.floor(vim.o.columns * 0.85)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.80)
          end,
        },
      })

      vim.keymap.set("n", "<C-_>", "<cmd>ToggleTerm<CR>", {
        desc = "Clean floating terminal",
      })

      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
    end,
  },
}
