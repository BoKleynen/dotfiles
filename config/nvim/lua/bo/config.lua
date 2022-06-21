local nvim_lsp = require "lspconfig"

local on_attach = function(client)
  require "completion".on_attach(client)
end

-- Enable rust analyzer
nvim_lsp.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
	importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    },
  },
})

