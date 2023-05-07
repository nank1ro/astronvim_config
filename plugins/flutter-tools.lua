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
      opts.debugger = {
        enabled = true,
        register_configurations = function(_)
          require("dap").configurations.dart = {}
          require("dap.ext.vscode").load_launchjs()
        end,
      }
    end,
  },
}
