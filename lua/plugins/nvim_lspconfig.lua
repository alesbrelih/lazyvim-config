local util = require("lspconfig.util")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type lspconfig.options
      servers = {
        helm_ls = {
          opts = {
            filetypes = { "helm" },
            cmd = { "helm_ls", "serve" },
            root_dir = function(fname)
              return util.root_pattern("Chart.yaml")(fname)
            end,
          },
        },
        tilt_ls = {
          filetypes = { "starlark" },
        },
        regols = {
          filetypes = { "rego" },
          opts = {
            cmd = { "regols" },
            root_dir = util.root_pattern(".git"),
          },
        },
        gopls = {
          settings = {
            gopls = {
              buildFlags = { "-tags=mock,integration_tests,contract_consumer,contract_provider" },
            },
          },
        },
      },
    },
  },
}
