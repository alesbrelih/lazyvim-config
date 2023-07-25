return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "mock%_.*%.go", "vendor/.+" },
      },
    },
  },
}
