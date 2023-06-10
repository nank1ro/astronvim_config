return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Telescope file_browser",
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      local telescope = require "telescope"
      telescope.load_extension "file_browser"
    end,
    keys = {
      {
        "<leader>fd",
        "<cmd> Telescope file_browser <CR>",
        desc = "telescope file_browser",
      },
      {
        "<leader>fD",
        "<cmd> Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "telescope file_browser with the path of the current buffer",
      },
    },
  },
}
