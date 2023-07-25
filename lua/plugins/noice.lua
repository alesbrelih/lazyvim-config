return {
  {
    "folke/noice.nvim",
    -- opts will be merged with the parent spec
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
        },
      },
    },
  },
}
