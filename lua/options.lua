-- To see common options
-- :options

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 0 -- if 0 fallsback to tabstop
vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 4

vim.opt.virtualedit = "block"

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split" -- pops a preview window when performing substitutions

vim.opt.termguicolors = true
vim.g.colorline = 80

vim.g.mapleader = " "

vim.opt.updatetime = 50

-- for nvim-tree, TODO: idk what they do yet
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
