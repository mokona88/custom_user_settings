-- local setup, dadbod = pcall(require, 'dadbod')
-- if not setup then
--   print('vim-dadbod plugin is not installed.')
--   return
-- end

vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_table_helpers = {
  postgresql = {
    List = 'SELECT * FROM "{table}" ORDER BY id ASC LIMIT 200;'
  }
}

vim.g.db_ui_icons = {
  expanded = '▾',
  collapsed = '▸',
  saved_query = '*',
  new_query = '+',
  tables = '~',
  buffers = '»',
  connection_ok = '✓',
  connection_error = '✕',
}

vim.g.db_ui_icons = {
  expanded = '+',
  collapsed = '-'
}

vim.g.db_ui_winwidth = 30

-- dadbod.setup({})

