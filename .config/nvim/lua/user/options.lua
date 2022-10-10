local g = vim.g
local o = vim.o
local opt = vim.opt
local cmd = vim.cmd

-- Options
o.termguicolors = true
o.hidden = true
o.number = true
o.rnu = true
o.cursorline = true
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = false
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1
o.list = true
o.clipboard = 'unnamedplus'
o.ignorecase = true
o.smartcase = true
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.splitright = true
o.splitbelow = true
o.background = 'dark'
o.cmdheight=0

opt.mouse = "a"

g.mapleader = ' '

