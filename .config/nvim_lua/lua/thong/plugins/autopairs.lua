local autopair_setup, autopairs = pcall(require, 'nvim-autopairs')
if not autopair_setup then
  print('nvim-autopairs is not installed!')
  return
end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
    javascript = { 'template_string' }, -- don't add pairs in javascript template_string
    java = false, -- don't check treesitter on java
  },
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmp_autopairs_setup then
  return
end

-- import nvim-cmp plugin safely
local cmp_setup, cmp = pcall(require, 'cmp')
if not cmp_setup then
  return
end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
