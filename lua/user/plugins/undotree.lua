return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })
  end
}
