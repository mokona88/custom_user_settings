local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
  },
  -- disable auto indent module from treesitter as it conflicts with other indentation tool and cause the feature breaking
  -- indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    'json', 'javascript', 'typescript', 'tsx', 'yaml', 'html', 'css', 'markdown', 'svelte', 'graphql', 'bash', 'lua', 'vim', 'dockerfile', 'gitignore'
  },
  auto_install = true,
})
