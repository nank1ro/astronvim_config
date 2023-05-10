local utils = require "astronvim.utils"
return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      dap.adapters.dart = {
        type = "executable",
        command = "flutter",
        args = { "debug-adapter" },
        options = {
          -- dartls is slow to start so avoid warnings from nvim-dap
          initialize_timeout_sec = 30,
        },
      }
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    opts = function(_, opts)
      opts.fvm = true
      opts.debugger = {
        enabled = true,
        register_configurations = function(_)
          require("dap").configurations.dart = {}
          require("dap.ext.vscode").load_launchjs()
        end,
      }
    end,
  },
  -- {
  --   "nank1ro/flutter-tools.nvim",
  --   ft = { "dart" },
  --   fvm = true,
  --   init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "dartls") end,
  --   opts = {
  --     lsp = require("astronvim.utils.lsp").config "dartls",
  --     debugger = {
  --       enabled = true,
  --     },
  --   },
  --   dependencies = {
  --     { "nvim-lua/plenary.nvim" },
  --     {
  --       "jay-babu/mason-nvim-dap.nvim",
  --       opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "dart") end,
  --     },
  --   },
  -- },
}
