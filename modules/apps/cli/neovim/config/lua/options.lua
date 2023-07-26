vim.opt.nu = true -- set numbers
vim.opt.relativenumber = true -- set relative numbers

local tab_size = 2 -- explicit right ?
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = tab_size -- general
vim.opt.softtabstop = tab_size -- while editing
vim.opt.shiftwidth = tab_size -- autoindent

vim.opt.hlsearch = false -- don't highlight search results 
vim.opt.incsearch = true -- search while typing

vim.opt.backup = false -- no backup files
vim.opt.swapfile = false -- no swap files

vim.opt.cursorline = true -- highlight current line

vim.g.mapleader = " " -- leader key
