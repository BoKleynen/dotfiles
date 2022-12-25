local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed {
	"sumneko_lua",
	"rust_analyzer",
    "gopls",
}

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup()
