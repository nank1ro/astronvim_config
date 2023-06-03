return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.pickers = {
      lsp_references = {
        show_line = false,
      },
    }
    return opts
  end,
}
