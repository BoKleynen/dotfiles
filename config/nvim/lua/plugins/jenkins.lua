return {
    "ckipp01/nvim-jenkinsfile-linter",
    ft = "groovy",
    config = function ()
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = 0,
            callback = function ()
               require("jenkinsfile_linter").validate()
            end,
        })
    end,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    }
}
