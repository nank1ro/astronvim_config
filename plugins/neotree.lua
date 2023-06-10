return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.default_component_configs.indent = { padding = 1, indent_size = 2 }
    return opts
  end,
}
