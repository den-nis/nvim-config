---@diagnostic disable: undefined-global

require("dennis.lazy");
require("dennis.keymaps");
require("dennis.commands");

-- Move selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv");
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv");

-- fix letters LSP
vim.opt.signcolumn = 'yes'

vim.lsp.set_log_level("debug");
vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd("set title");
vim.cmd("set titlestring=Neovim");
vim.cmd("set tabstop=4");
vim.cmd("set shiftwidth=4");
