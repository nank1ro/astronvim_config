local utils = require "astronvim.utils"
local user_utils = require "user.utils"
local dartls_config = require("astronvim.utils.lsp").config "dartls"
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
    ft = { "dart" },
    init = function() astronvim.lsp.skip_setup = utils.list_insert_unique(astronvim.lsp.skip_setup, "dartls") end,
    opts = {
      lsp = {
        color = {
          -- show the derived colours for dart variables
          enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = "■", -- the virtual text character to highlight
        },
        on_attach = dartls_config.on_attach,
        capabilities = dartls_config.capabilities, -- e.g. lsp_status capabilities
        --- OR you can specify a function to deactivate or change or control how the config is created
        -- capabilities = function(config)
        --   config.specificThingIDontWant = false
        --   return config
        -- end,
        -- see the link below for details on each option:
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          analysisExcludedFolders = {
            user_utils.path_join(user_utils.flutter_sdk_path(), "packages"),
            user_utils.path_join(user_utils.flutter_sdk_path(), ".pub-cache"),
            user_utils.path_join(user_utils.home_path, ".pub-cache"),
            user_utils.path_join(user_utils.home_path, "fvm/versions"),
          },
          renameFilesWithClasses = "always", -- "always"
          enableSnippets = true,
          updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
        },
      },
      debugger = {
        enabled = true,
        register_configurations = function(_)
          require("dap").configurations.dart = {}
          require("dap.ext.vscode").load_launchjs()
        end,
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "dart") end,
      },
    },
  },
  -- Add "flutter" extension to "telescope"
  { "nvim-telescope/telescope.nvim", opts = function() require("telescope").load_extension "flutter" end },
}
