---@diagnostic disable: undefined-global
-- Download the lazy plugin manager
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
require("lazy").setup("plugins")

-- Setup theme
vim.print('Dennis\'s vim config')

-- fix letters LSP
vim.opt.signcolumn = 'yes'

vim.wo.number = true
vim.wo.relativenumber = true

vim.lsp.set_log_level("debug");

vim.cmd("set title");
vim.cmd("set titlestring=Neovim");
