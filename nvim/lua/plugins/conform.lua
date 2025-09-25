return {
  {
    "stevearc/conform.nvim",
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
