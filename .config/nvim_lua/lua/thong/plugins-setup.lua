local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, 'packer')
if not status then
  print('Packer is not installed!')
  return
end

return packer.startup(function(use)
  use('wbthomason/packer.nvim')

  -- lua functions that many plugins use
  use('nvim-lua/plenary.nvim')

  use('bluz71/vim-nightfly-guicolors') -- preferred colorscheme

  -- tmux & split window navigation
  use('christoomey/vim-tmux-navigator')

  use('szw/vim-maximizer') -- maximizes and restores current window

  -- essential plugins
  use('tpope/vim-surround')
  use('vim-scripts/ReplaceWithRegister')

  -- commenting with gc
  use('numToStr/Comment.nvim')

  -- icons
  -- use('nvim-tree/nvim-web-devicons')

  -- file explorer
  use{ 'nvim-tree/nvim-tree.lua', requires = {
    'nvim-tree/nvim-web-devicons'
  }, tag = 'nightly' }

  -- status-line
  use('nvim-lualine/lualine.nvim')

  -- tab-line
  use{'romgrk/barbar.nvim', requires = {
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim'
  }}

  -- fuzzy finding
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x' })
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- autocompletion
  use({'hrsh7th/nvim-cmp', tag = 'v0.0.1'})
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')

  -- snippets
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  use('rafamadriz/friendly-snippets')

  -- managing & installing lsp servers
  use{'williamboman/mason-lspconfig.nvim', branch = 'main', requires = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
  }}

  -- configuring lsp servers
  -- use('neovim/nvim-lspconfig')
  use('hrsh7th/cmp-nvim-lsp')
  use({ 'glepnir/lspsaga.nvim', branch = 'main', commit = '1e1d2dd66f040a11032ab65a1c69d272cedb4cb5'})
  use 'jose-elias-alvarez/typescript.nvim'
  use 'onsails/lspkind.nvim'

  -- formatting and linting
  use{'jay-babu/mason-null-ls.nvim', requires = {
    'jose-elias-alvarez/null-ls.nvim',
    'williamboman/mason.nvim',
    'nvimtools/none-ls.nvim'
  }}

  --------------------------------------
  -- treesitter for better highlighting
  --------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- auto closing tags
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  --------------------------------------
  -- git related plugins
  --------------------------------------
  use 'lewis6991/gitsigns.nvim'

  -- Java language support
  use 'mfussenegger/nvim-jdtls'
  -- dev environment support
  use 'ellisonleao/dotenv.nvim'

  --------------------------------------
  -- database plugins
  --------------------------------------
  use{'kristijanhusak/vim-dadbod-ui', requires = {
    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-completion'
  }}

  --------------------------------------
  -- github copilot
  --------------------------------------
  use{'github/copilot.vim', branch = 'release' }

  if packer_bootstrap then
    print('packer_bootstrap is true')
    require('packer').sync()
  end
end)
