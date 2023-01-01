local ms_status, mason = pcall(require, 'mason')
if not ms_status then
  print('mason is not installed!')
  return
end

local ms_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ms_lspconfig_status then
  print('mason-lspconfig is not installed!')
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_status then
  print('mason-null-ls is not installed!')
  return
end

mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    'tsserver',
    'html',
    'cssls',
    'tailwindcss',
    'sumneko_lua',
    'emmet_ls',
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    'prettier', 'stylua', 'eslint_d'
  },
  -- auto install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
