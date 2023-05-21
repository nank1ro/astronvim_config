return {
  {
    "kylechui/nvim-surround",
    event = "User AstroFile",
    opts = {},
    setup = function() require("mini.move").setup() end,
  },
}
