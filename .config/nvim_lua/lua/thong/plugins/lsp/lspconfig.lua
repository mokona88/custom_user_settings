local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
  print('lspconfig not installed!')
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
  print('cmp_nvim_lsp not installed!')
  return
end

local typescript_setup, typescript = pcall(require, 'typescript')
if not typescript_setup then
  print('typescript not installed!')
  return
end

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
  local opts = {
    noremap = true, silent = true, buffer = bufnr
  }

  -- set keybinds
  keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<cr>', opts)
  keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', opts)
  keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)
  keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', opts)
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<cr>', opts)
  keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
  keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
  keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
  keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>', opts)

  if client.name == 'tsserver' then
    keymap.set('n', '<leader>rf', ':TypescriptRenameFile<cr>')
  end
end

-- used to enable autocompletion for each of lsp server
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig['html'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
})

lspconfig['cssls'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['tailwindcss'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['sumneko_lua'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for Lua
    Lua = {
      -- make the language server recognize 'vim' global
      diagnostics = { globals = {'vim'} },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
    },
  }
})
