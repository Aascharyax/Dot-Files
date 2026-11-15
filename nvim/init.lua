-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.keymap.set("n", "<leader>t", function()
    local dir = vim.fn.expand("%:p:h")
    vim.fn.jobstart({ "kitty", "--directory", dir }, {
        detach = true,
    })
end, { desc = "Open Kitty in current file directory" })