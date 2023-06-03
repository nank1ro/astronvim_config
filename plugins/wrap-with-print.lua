vim.api.nvim_create_user_command("WrapWithPrint", function() require("wrap-with-print").wrap() end, {})

return {
  {
    "wrap-with-print",
    dir = "~/.config/nvim/lua/user/custom-plugins/wrap-with-print",
    event = "User AstroFile",
  },
}
