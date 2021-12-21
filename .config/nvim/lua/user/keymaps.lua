local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.api.nvim_set_keymap


-- map leader key
map('n', '<space>', '<Nop>', opts)
vim.g.mapleader = ' ' 


-- use jj for esc
map('i', 'jj', '<esc>', {})

-- switch between panes
map('n', '<C-j>', '<C-W><C-J>', opts)
map('n', '<C-k>', '<C-W><C-K>', opts)
map('n', '<C-l>', '<C-W><C-L>', opts)
map('n', '<C-h>', '<C-W><C-H>', opts)

-- clear highlights
map('n', '//', ':noh<return>', opts)

-- more to first and last char of line
map('n', 'L', '$', opts)
map('n', 'H', '^', opts)

-- leader e to open a new file
map('n', '<leader>e', ':e ', { noremap = true })
map('n', '<leader>E', ':Lex<cr>', { noremap = true })

-- remap ä and ü
map('n', 'ü', '{', opts)
map('n', 'ä', '}', opts)

-- remap ä and ü in visual Mode
map('v', 'ü', '{', opts)
map('v', 'ä', '}', opts)

-- navigate buffers
map('n', 'bn', ':bnext<CR>', opts)
map('n', 'bp', ':bprevious<CR>', opts)
map('n', 'bf', ':bfirst<CR>', opts)
map('n', 'bl', ':blast<CR>', opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Stay in visual mode when shifting text
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Terminal --
-- open Terminal 
map("n", '<leader>t', ':sp<CR>:terminal<CR>', opts )

-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
