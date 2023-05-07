return {
  {
    "jiaoshijie/undotree",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function() require("undotree").setup() end,
    keys = {
      { "<leader>ut", function() require("undotree").toggle() end },
      desc = "Toggle UndoTree",
    },
  },
}
