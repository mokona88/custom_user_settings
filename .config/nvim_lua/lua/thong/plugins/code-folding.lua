local api = vim.api
local M = {}

function M.nvim_create_augroups(defs)
  for group_name, definition in pairs(defs) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local cmd = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(cmd)
    end
  end
end

local autoCommands = {
  open_folds = {
    {"BufReadPost,FileReadPost", "*", "normal zR"}
  }
}

M.nvim_create_augroups(autoCommands)
