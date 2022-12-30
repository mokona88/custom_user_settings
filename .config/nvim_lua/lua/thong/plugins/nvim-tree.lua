local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
  print('nvim-tree is not installed!')
  return
end

-- recommended settings from nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guigf=#3FC5FF ]])

nvimtree.setup({
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = '▸',
          arrow_open = '▾',
        }
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      },
    },
  },
})
