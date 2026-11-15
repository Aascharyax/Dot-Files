
return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      extra_groups = {
        "NormalFloat",
        "FloatBorder",
        "SignColumn",
        "NormalNC",
        "EndOfBuffer",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "TelescopeNormal",
        "WhichKeyFloat",
      },
      exclude_groups = {},
    },
    config = function(_, opts)
      require("transparent").setup(opts)
      vim.cmd("TransparentEnable")
    end,
  },
}
