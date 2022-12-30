local status, null_ls = pcall(require, 'null-ls')
if not status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.stylua,
    diagnostics.eslint_d
  },
  on_attach = function (current_client, bufnr)
    if current_client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({
            filter = function (client)
              -- only use null-ls for formatting instead of lsp server
              return client.name == 'null_ls'
            end
          })
        end
      })
    end
  end
})
