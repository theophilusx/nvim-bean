return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
  config = function()
    local wk = require("which-key")

    wk.register({
        e = {
          name = "Explore"
        },
        f = {
          name = "Files"
        },
        g = {
          name = "Git"
        },
        h = {
          name = "Harpoon"
        },
        j = {
          name = "Jump"
        },
        l = {
          name = "LSP"
        },
        x = {
          name = "Misc"
        },
      },
      {
        prefix = "<Leader>"
      })
  end

}
