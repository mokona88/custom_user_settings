local opt = vim.opt

-- line numbers
opt.number = true


-- tabs && indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true


-- line wrapping
opt.wrap = false
-- code folding
opt.foldmethod = "manual"
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.nofoldenable = true
opt.foldlevel = 2
opt.foldnestmax = 10

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

-- backspace
opt.backspace = 'indent,eol,start'

-- Windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append { '-' }

opt.autoread = true

