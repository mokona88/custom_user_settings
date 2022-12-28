require('thong.core.base')
require('thong.plugins')
require('thong.core.keymaps')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('thong.macos')
end
if is_win then
  require('thong.win')
end
