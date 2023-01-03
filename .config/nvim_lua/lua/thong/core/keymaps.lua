vim.g.mapleader = '\\'

local keymap = vim.keymap

-- general keymaps

-- keymap.set('i', 'jk', '<esc>')
keymap.set('n', '<leader>nh',':nohl<CR>')

keymap.set('n', 'x', '"_x') -- delete a character without saving a backup in memory

keymap.set('n', '<leader>=', '<C-a>') -- increment/decrement numbers
keymap.set('n', '<leader>-', '<C-x>') -- increment/decrement numbers

keymap.set('n', 'vh', ':vsplit<Return><C-w>w')
keymap.set('n', 'vs', ':split<Return><C-w>w')
keymap.set('n', 'v=', '<C-w>=') -- make split window equal width
keymap.set('n', 'vx', ':close<CR>')

keymap.set('n', 'te', ':tabnew<CR>') -- open new tab, same idea with :tabedit
keymap.set('n', 'tx', ':tabclose<CR>') -- close current tab
keymap.set('n', '<Tab>', ':tabn<CR>') -- go to next tab, or :tabnext
keymap.set('n', '<S-Tab>', ':tabp<CR>') -- go to previous tab, or :tabprev

keymap.set('n', 'fp', '<cmd>echo expand(\'%:p\')<cr>')

-- plugin keymap

-- vim-maximizer
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')

-- nvim-tree keymaps
-- keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- telescope mappings
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<CR>')
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<CR>')
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
