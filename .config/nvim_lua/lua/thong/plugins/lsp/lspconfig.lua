local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
local filetype                    = require('vim.filetype')
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

-- enable keybinds only when lsp server is available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<cr>', opts)
  keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', opts)
  keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)
  keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', opts)
  keymap.set('n', '<leader>D', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
  keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<cr>', opts)
  keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
  keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
  keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
  keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>', opts)

  if client.name == 'tsserver' then
    keymap.set('n', '<leader>rf', ':TypescriptRenameFile<cr>')
    keymap.set('n', '<leader>oi', ':TypescriptOrganizeImports<cr>')
    keymap.set('n', '<leader>oi', ':TypescriptRemoveUnused<cr>')
  end

  -- if client.name == 'jdt.ls' then
  --   client.resolve_capabilities.document_formatting = false
  -- end
end

-- used to enable autocompletion for each of lsp server
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig['html'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
})

-- configure css server
lspconfig['cssls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig['tailwindcss'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure emmet language server
lspconfig['emmet_ls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
})

-- configure lua server (with custom settings)
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
  },
})

-- Java language server setup using lsp_jdtls language server. This service creates a java filetype hook itself and provide default cmd config
-- In the future would move over to nvim-jdtls plugin instead
-- local home_path = vim.fn.getenv('HOME')
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = home_path .. '/projects/backend/' .. project_name
-- local mason_path = home_path .. '/.local/share/nvim/mason'
-- lspconfig['jdtls'].setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   flags = {
--     debounce_text_changes = 150,
--   },
--   cmd = {
--     -- 💀
--     'java', -- or '/path/to/java17_or_newer/bin/java'
--             -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.protocol=true',
--     '-Dlog.level=ALL',
--     '-Xms1g',
--     '--add-modules=ALL-SYSTEM',
--     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--     '-jar', home_path .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--          -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
--          -- Must point to the                                                     Change this to
--          -- eclipse.jdt.ls installation                                           the actual version
--
--     '-configuration', mason_path .. '/packages/jdtls/config_mac',
--                     -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
--                     -- Must point to the                      Change to one of `linux`, `win` or `mac`
--                     -- eclipse.jdt.ls installation            Depending on your system.
--     -- See `data directory configuration` section in the README
--     '-data', workspace_dir
--   },
--
--   -- 💀
--   -- This is the default if not provided, you can remove it. Or adjust as needed.
--   -- One dedicated LSP server & client will be started per unique root_dir
--   -- root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
--
--   -- Here you can configure eclipse.jdt.ls specific settings
--   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--   -- for a list of options
--   settings = {
--     java = {
--       completion = {
--         enabled = true,
--         filteredTypes = { 'java', 'javax', 'com', 'org' }
--       },
--       reference_code_lens = {
--         enabled = true,
--       }
--     }
--   },
--
--   -- Language server `initializationOptions`
--   -- You need to extend the `bundles` with paths to jar files
--   -- if you want to use additional eclipse.jdt.ls plugins.
--   --
--   -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--   --
--   -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
--   init_options = {
--     bundles = {}
--   },
-- })
