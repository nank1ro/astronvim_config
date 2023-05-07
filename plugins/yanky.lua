return {
  {
    "gbprod/yanky.nvim",
    before = "nvim-telescope/telescope.nvim",
    config = function() require("yanky").setup {} end,
    keys = {
      { "<leader>yh", "<cmd> Telescope yank_history <CR>", desc = "telescope yank_history" },
    },
  },
}
