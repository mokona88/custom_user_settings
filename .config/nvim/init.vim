let g:airline_theme='onedark'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline#extensions#branch#vcs_priority = ["git"]
let g:airline#extensions#branch#format = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'
let g:vimfiler_as_default_explorer = 1

"----------------------------------------
" Windows
"----------------------------------------

" Tabs
nmap te :tabedit<Return>
" List tabs
nmap tl :Unite tab
" Operating with tabs
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
nnoremap ,l <C-I>

" Split window
nmap vs :split<Return><C-w>w
nmap vh :vsplit<Return><C-w>w
nmap vf :VimFiler<Return>
nmap gv :GV<Return>

" Move window
" nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map zh <C-w>h
map zk <C-w>k
map zj <C-w>j
map zl <C-w>l

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

" set background=dark
" set t_Co=256
let g:one_allow_italics = 1
" Disable version warning
let g:go_version_warning = 0
let g:split_term_default_shell = "zsh"

" Configuration for jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

" Configuration for vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" set folding
augroup javascript_folding
  au!
  au FileType javacript setlocal foldmethod=syntax
augroup END

set foldmethod=syntax
set foldcolumn=1
let javscript_fold=1
set foldlevelstart=10

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" set conceallevel = 1
map <leader>l :exec &conceallevel ? 'set conceallevel=0' : 'set conceallevel=1'<CR>

" Clear search when input nothing
let @/=""

set number
set nowrap
set path+=**
set expandtab
set tabstop=2
set shiftwidth=2


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat -p \"".expand("%").expand("\"") | :bw

" Mapping commands
command! Term :Terminal zsh
command! Vterm :TerminalVSplit zsh
command! Hterm :TerminalSplit zsh
