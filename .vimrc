let g:airline_theme='onedark'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline#extensions#branch#vcs_priority = ["git"]
let g:airline#extensions#branch#format = 1
let g:airline#extensions#branch#displayed_head_limit = 10

" vim-plug plugin
call plug#begin()
  " Make sure you use single quotes

  " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
  Plug 'junegunn/vim-easy-align'

  " Any valid git URL is allowed
  Plug 'https://github.com/junegunn/vim-github-dashboard.git'

  " Multiple Plug commands can be written in a single line using | separators
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

  " On-demand loading
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'

  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

  " Using a non-master branch
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

  " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
  Plug 'fatih/vim-go', { 'tag': 'v1.22' }

  " Plugin options
  Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

  " Plugin outside ~/.vim/plugged with post-update hook
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " Unmanaged plugin (manually installed and updated)
  " Plug '~/my-prototype-plugin'

  Plug 'https://github.com/rakr/vim-one.git'

  Plug 'scrooloose/nerdtree'

  " Lean & mean status / Tabline for vim
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'

  Plug 'yuratomo/w3m.vim'

  " Terminal plugins for vim
  Plug 'tc50cal/vim-terminal'
  " Plug 'vimlab/split-term.vim'
  " Plug 'sollidsnake/vterm'
  " Plug 'pangpangpangpangpang/vim-terminal'

  " Emmet plugin for html auto completion
  Plug 'mattn/emmet-vim'

  " Typescript syntax highlighting for vim
  Plug 'leafgarland/typescript-vim'
  " JSX extension for syntax highlighting
  Plug 'maxmellon/vim-jsx-pretty'

  " View Image in NVIM
  " Plug 'ashisha/image.vim'
  
  " Downgrade a plugin
  Plug 'SirVer/ultisnips', { 'tag': '3.0' }
call plug#end()
" set background=dark
" set t_Co=256
let g:one_allow_italics = 1
" Disable version warning
let g:go_version_warning = 0
let g:split_term_default_shell = "zsh"

" Configuration for jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

" Clear search when input nothing
let @/=""

" Configuration for NERDTree
let NERDTreeWinSize=50
let NERDTreeWinSizeMax=50

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
autocmd VimEnter * NERDTree

" Mapping commands
command! Term :Terminal zsh
command! Vterm :TerminalVSplit zsh
command! Hterm :TerminalSplit zsh
"cabbrev :term :Terminal "zsh"
"cabbrev :vterm :TerminalVSplit "zsh"
"cabbrev :hterm :TerminalSplit "zsh"


