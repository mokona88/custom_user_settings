local ms_status, mason = pcall(require, 'mason')
if not ms_status then
  print('mason is not installed!')
  return
end

local ms_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ms_lspconfig_status then
  print('mason_lspconfig is not installed!')
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_status then
  print('mason-null-ls is not installed!')
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    'tsserver',
    'html',
    'cssls',
    'tailwindcss',
    'sumneko_lua',
  }
})

mason_null_ls.setup({
  ensure_installed = {
    'prettier', 'stylua', 'eslint_d'
  }
})
