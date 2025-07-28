local setup, gitsigns = pcall(require, 'gitsigns')
if not setup then
  print('gitsigns is not installed!')
  return
end

gitsigns.setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Actions
    map('n', '<leader>gb', function() gs.blame_line{full=true} end)
  end
}
