vim.g.mapleader = '\\'

local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- general keymaps

-- keymap.set('i', 'jk', '<esc>')
keymap.set('n', '<leader>nh',':nohl<CR>')

keymap.set('n', 'x', '"_x') -- delete a character without saving a backup in memory

keymap.set('n', '<leader>=', '<C-a>') -- increment/decrement numbers
keymap.set('n', '<leader>-', '<C-x>') -- increment/decrement numbers

keymap.set('n', 'md', ':m+<cr>') -- move current line down 1 line
keymap.set('n', 'mu', ':m-2<cr>') -- move current line up 1 line

keymap.set('n', 'vh', ':vsplit<cr>')
keymap.set('n', 'vs', ':split<cr>')
keymap.set('n', 'v0', '<C-w>=') -- make split window equal width
keymap.set('n', 'v.', '20<C-w>>') -- incrase window width
keymap.set('n', 'v,', '20<C-w><') -- decrease window width
keymap.set('n', 'v=', '<C-w>+') -- decrease window height
keymap.set('n', 'v-', '<C-w>-') -- decrease window height
keymap.set('n', 'vx', ':close<CR>')
keymap.set('n', '<leader>vx', '<cmd>BufferClose<cr><cr>', opts)

keymap.set('n', 'te', ':tabnew<CR>') -- open new tab, same idea with :tabedit
keymap.set('n', 'tx', ':tabclose<CR>') -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>') -- go to next tab, or :tabnext
keymap.set('n', '<leader>tp', ':tabp<CR>') -- go to previous tab, or :tabprev

-- Tabline plugins
keymap.set('n', 'tn', '<cmd>BufferNext<cr>', opts)
keymap.set('n', 'tp', '<cmd>BufferPrevious<cr>', opts)
keymap.set('n', 'mn', '<cmd>BufferMoveNext<cr>', opts)
keymap.set('n', 'mp', '<cmd>BufferMovePrevious<cr>', opts)
keymap.set('n', 'tc', '<cmd>BufferClose<cr><cr>')
-- keymap.set('n', '<Tab>', ':tabn<CR>') -- go to next tab, or :tabnext
-- keymap.set('n', '<S-Tab>', ':tabp<CR>') -- go to previous tab, or :tabprev

keymap.set('n', 'fs', ':w<cr>') -- file save

keymap.set('n', 'fp', '<cmd>echo expand(\'%:p\')<cr>')
keymap.set('n', 'fr', ':e<cr>') -- reload from disk
keymap.set('n', 'lf', '<cmd>NvimTreeFindFile<cr>')

-- plugin keymap

-- vim-maximizer
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')

-- nvim-tree keymaps
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
keymap.set('n', '<leader>-', ':NvimTreeResize -20<CR>')
keymap.set('n', '<leader>+', ':NvimTreeResize +20<CR>')
keymap.set('n', '<leader>er', ':NvimTreeRefresh<CR>')
keymap.set('n', '<leader>ec', ':NvimTreeCollapse<CR>')

-- telescope mappings
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<CR>')
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<CR>')
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')

-- database UI tool
keymap.set('n', '<leader>db', '<cmd>DBUI<CR>')
