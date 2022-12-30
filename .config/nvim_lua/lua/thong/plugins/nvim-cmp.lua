local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
  print('cmp is not installed!!!')
  return
end

local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then
  print('luasnip is not installed!!!')
  return
end

local lspkind_status, lspkind = pcall(require, 'lspkind')
if not lspkind_status then
  print('lspkind is not installed!!!')
  return
end

-- load friendly-snippets
require('luasnip/loaders/from_vscode').lazy_load()

local opt = vim.opt
opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- lsp
    { name = 'luasnip' }, -- code snippets
    { name = 'buffer' }, -- text within current buffer
    { name = 'path' }, -- file system paths
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = '...',
    }),
  },
})

