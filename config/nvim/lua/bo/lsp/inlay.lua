require("inlay-hints").setup {
    -- renderer to use
    -- possible options are dynamic, eol, virtline and custom
    -- renderer = "inlay-hints/render/dynamic",
    renderer = "inlay-hints/render/eol",

    hints = {
        parameter = {
            show = true,
            highlight = "whitespace",
        },
        type = {
            show = true,
            highlight = "Whitespace",
        },
    },
    -- Only show inlay hints for the current line
    only_current_line = false,
}

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my-inlay-hints", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("inlay-hints").on_attach(client, args.buf)
    end,
})

