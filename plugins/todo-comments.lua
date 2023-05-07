-- Examples:
-- TODO: ciao
-- HACK: ciao
-- WARNING: ciao
-- FIXME: ciao
-- NOTE: ciao
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- config = function() require("todo-comments").setup {} end,
    -- equivalent to
    opts = {},
    event = "User Astrofile",
    -- preload the plugin with the following commands
    cmd = { "TodoTelescope" },
  },
}
