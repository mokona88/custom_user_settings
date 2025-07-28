local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
  print('nvim-tree is not installed!')
  return
end

-- recommended settings from nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
  sort_by = "case_sensitive",
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
  -- actions = {
  --   open_file = {
  --     window_picker = {
  --       enable = false
  --     },
  --   },
  -- },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    -- custom = {
    --   'node_modules'
    -- }
  },
  view = {
    width = 45,
    number = true
  }
})
