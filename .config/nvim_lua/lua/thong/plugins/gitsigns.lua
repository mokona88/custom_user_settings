local setup, gitsigns = pcall(require, 'gitsigns')
if not setup then
  print('gitsigns is not installed!')
  return
end

gitsigns.setup()
