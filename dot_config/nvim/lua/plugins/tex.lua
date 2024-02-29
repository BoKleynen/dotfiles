local pdf_viewer = vim.loop.os_uname().sysname == "Darwin" and "skim" or "zathura"

return {
    "lervag/vimtex",
    ft = "tex",
    config = function ()
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_view_method = pdf_viewer
        vim.g.vimtex_compiler_lexmk = {
            build_dir = "build",
        }
    end
}
