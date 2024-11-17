vim.g.mapleader = " " -- space
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.relativenumber = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.wrap = false
vim.o.whichwrap = "b,s,<,>,[,],h,l"

vim.o.mouse = "a"

vim.keymap.set({ "n", "i" }, "<leader>w", ":w<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>")

vim.keymap.set("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>")

vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
