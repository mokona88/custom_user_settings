require('thong.plugins-setup')
require('thong.core.options')
require('thong.core.colorscheme')
require('thong.core.keymaps')
require('thong.plugins.comment')
require('thong.plugins.lualine')
require('thong.plugins.telescope')
require('thong.plugins.nvim-cmp')
require('thong.plugins.lsp.mason')
require('thong.plugins.lsp.lspsaga')
require('thong.plugins.lsp.lspconfig')
require('thong.plugins.lsp.null-ls')
require('thong.plugins.autopairs')
require('thong.plugins.treesitter')
require('thong.plugins.gitsigns')
-- require('thong.plugins.nvim-tree')

local has = vim.fn.has
local is_mac = has "macunix"

if is_mac then
  require('thong.core.options_macos')
end
