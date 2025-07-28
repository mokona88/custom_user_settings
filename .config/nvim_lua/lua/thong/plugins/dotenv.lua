local setup, dotenv = pcall(require, 'dotenv')
if not setup then
  print('dotenv plugin is not installed.')
  return
end

dotenv.setup({
  enable_on_load = true,
  verbose = true
})
