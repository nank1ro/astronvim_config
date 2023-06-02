return {
  {
    "nvim-treesitter/playground",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
    setup = function() require("nvim-treesitter.configs").setup {} end,

    -- preload the plugin with the following commands
    cmd = { "TSPlaygroundToggle" },
  },
}
