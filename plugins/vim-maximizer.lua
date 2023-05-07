return {
  {
    "szw/vim-maximizer",
    event = "User AstroFile",
    keys = {
      { "<C-w>m", "<cmd> MaximizerToggle<CR>", desc = "Toggle Maximizer" },
      { "<C-w>m", "<C-o><cmd> MaximizerToggle<CR>", mode = "i", desc = "Toggle Maximizer" },
      { "<C-w>m", "<cmd> MaximizerToggle<CR>gv", mode = "v", desc = "Toggle Maximizer" },
    },
  },
}
