return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require "telescope.actions"
    opts.pickers = {
      lsp_references = {
        show_line = false,
      },
    }
    opts.defaults.mappings.n = {
      ["d"] = "delete_buffer",
      q = actions.close,
    }
    return opts
  end,
}
