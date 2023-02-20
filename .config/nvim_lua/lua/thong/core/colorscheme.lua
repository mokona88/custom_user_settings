-- local status, _ = pcall(vim.cmd, 'colorscheme NeoSolarized')
local status, _ = pcall(vim.cmd, 'colorscheme nightfly')

if not status then
  print('Colorscheme nightfly not found!')
  return
end

vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
