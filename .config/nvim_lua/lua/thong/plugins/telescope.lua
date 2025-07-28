local tl_setup, telescope = pcall(require, 'telescope')

if not tl_setup then
  print('telescope is not installed!')
  return
end

-- telescope should be successfully installed at this step, could direct import without checking
local actions = require('telescope.actions')
-- local builtin = require('telescope.builtin')

local path = '%:p:h'
-- local function telescope_buffer_dir()
--   return vim.fn.expand(path)
-- end

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      file_ignore_patterns = {'.git/', 'node_modules/', '$lock'}
    }
  },
  file_ignore_patterns = {
    -- 'node_modules',
    -- 'node_modules/',
    '$lock'
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disable netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          -- custom insert mode mappings
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          -- custom normal mode mappings
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function ()
            vim.cmd('startinsert')
          end,
          ['.'] = fb_actions.toggle_hidden,
          ['<C-u>'] = actions.results_scrolling_up,
          ['<C-d>'] = actions.results_scrolling_down
        }
      }
    }
  }
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')

vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = path,
    cwd = vim.fn.expand(path),
    respect_gitignore = false,
    -- hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = 'normal',
    layout_config = { height = 40 }
  })
end)
