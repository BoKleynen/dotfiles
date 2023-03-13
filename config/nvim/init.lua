if vim.g.neovide then
  vim.g.neovide_cursor_trail_legnth = 0
  vim.g.neovide_cursor_animation_length = 0
  vim.o.guifont = "MonoLisa Nerd Font"
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {})

require("bo")

