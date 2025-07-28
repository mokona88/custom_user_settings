local ms_status, mason = pcall(require, 'mason')
if not ms_status then
  print('mason is not installed!')
  return
end

local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
  print('nvim-lspconfig is not installed!')
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

local null_ls_status, null_ls = pcall(require, 'null-ls')
if not null_ls_status then
  print('null-ls is not installed!')
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local keymap = vim.keymap

local handlers = {
  function (server_name)
    if (server_name == "emmet_ls") then
      lspconfig["emmet_ls"].setup({
        capabilities = capabilities,
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        }
      })
    else
      lspconfig[server_name].setup({})
    end
  end,

  ["ts_ls"] = function(client, bufnr)
      -- keybind options
      local opts = { noremap = true, silent = true, bufnr = bufnr }

      -- set keybinds
      keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<cr>', opts)
      keymap.set('n', 'gD', '<cmd>vsplit<cr><cmd>Lspsaga goto_definition<cr>', opts)
      keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', opts)
      keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      keymap.set('n', 'gl', '<cmd>Lspsaga show_diagnostic<cr>', opts)
      keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)
      keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', opts)
      keymap.set('n', '<leader>D', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
      keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<cr>', opts)
      keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
      keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
      keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
      keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>', opts)

      keymap.set('n', '<leader>rf', ':TypescriptRenameFile<cr>')
      keymap.set('n', '<leader>oi', ':TypescriptOrganizeImports<cr>')
      keymap.set('n', '<leader>oi', ':TypescriptRemoveUnused<cr>')
  end,

  -- lspconfig.ts_ls.setup {
  --   on_attach = function(client, bufnr)
  --   end,
  -- }
}

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    'ts_ls',
    'lua_ls',
    'html',
    'cssls',
    'tailwindcss',
    -- 'sumneko_lua',
    'emmet_ls',
    'ast_grep',
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true,
  handlers = handlers,
})

 mason_null_ls.setup({
   -- list of formatters & linters for mason to install
   ensure_installed = {
     'prettier', 'stylua', 'eslint_d', 'jq'
   },
   -- auto install configured formatters & linters (with null-ls)
   automatic_installation = true,
     methods = {
     diagnostic = true,
     formatting = true,
     code_actions = true,
       completion = true,
     hover = true,
   },
   handlers = {
     function() end,
     stylua = function(source_name, methods)
       null_ls.register(null_ls.builtins.formatting.stylua)
     end,
     shfmt = function(source_name, methods)
       mason_null_ls.default_setup(source_name, methods)
     end,
   },
})
