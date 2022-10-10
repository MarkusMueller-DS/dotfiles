-- Function to remap keybindings
local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true, noremap = true })
end

map('i', 'jk', '<ESC>')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- switch between panes
map('n', '<C-j>', '<C-W><C-J>')
map('n', '<C-k>', '<C-W><C-K>')
map('n', '<C-l>', '<C-W><C-L>')
map('n', '<C-h>', '<C-W><C-H>')

-- clear highlights
map('n', '//', ':noh<return>')

-- remap ä and ü
map('n', 'ü', '{')
map('n', 'ä', '}')

-- remap ä and ü in visual Mode
map('v', 'ü', '{')
map('v', 'ä', '}')

-- Stay in visual mode when shifting text
map("v", "<", "<gv")
map("v", ">", ">gv")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

