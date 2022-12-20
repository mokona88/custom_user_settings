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
  " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  " Plug 'Xuyuanp/nerdtree-git-plugin'
  " Plug 'airblade/vim-gitgutter'

  " Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

  " Using a non-master branch
  " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

  " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
  " Plug 'fatih/vim-go', { 'tag': 'v1.22' }

  " Plugin options
  " Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

  " Plugin outside ~/.vim/plugged with post-update hook
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  " Unmanaged plugin (manually installed and updated)
  " Plug '~/my-prototype-plugin'

  " Theme pluggins
"  Plug 'https://github.com/rakr/vim-one.git'
  Plug 'https://github.com/joshdick/onedark.vim.git'

  " Lean & mean status / Tabline for vim
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Git commit browser
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'

  " Plug 'yuratomo/w3m.vim'

  " Terminal plugins for vim
  Plug 'tc50cal/vim-terminal'
  " Plug 'vimlab/split-term.vim'
  " Plug 'sollidsnake/vterm'
  " Plug 'pangpangpangpangpang/vim-terminal'

  " Emmet plugin for html auto completion
  Plug 'mattn/emmet-vim'

  " Typescript syntax highlighting for vim
  " Plug 'leafgarland/typescript-vim'
  " JSX extension for syntax highlighting
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'

  " View Image in NVIM
  " Plug 'ashisha/image.vim'
  
  " Downgrade a plugin
  " Plug 'SirVer/ultisnips', { 'tag': '3.0' }

  " File manager
  Plug 'shougo/unite.vim'
  Plug 'shougo/vimfiler.vim'


  if has("nvim")
    Plug 'neovim/nvim-lspconfig'
  endif
call plug#end()

