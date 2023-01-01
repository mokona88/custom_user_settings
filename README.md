# custom_user_settings
for personal use
1. Install zsh.
2. Install zprezto: https://github.com/sorin-ionescu/prezto
    - update .zpreztorc.
    - Install powerlevel10k fonts.
3. Install tmux
    - Install tmux plugin manager tpm: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`.
4. Install powerline plugins: `git clone https://github.com/powerline/powerline.git ~/plugins/powerline`
    - On Monterey, might just work.
    - On earlier version(or Python3.9), `powerline_*` execution scripts are copied to Python3.9 folder. e.g. `/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin`. Update $PATH variable in shell/bash to get tmux `run-shell` command working.
    - Install powerline fonts: `git clone https://github.com/powerline/fonts.git`.
4. Install fzf (lazy searching)
5. Install vim plugins.
6. Checkout vimrc for complete list of vimplug plugins

# Nvim installation instructions - using Vim Plug & Vimscript

# Nvim installation instructions - using Packer & Lua version
1. Install neovim.
2. Install packer.
    - `git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
3. Copy content of `nvim_lua` config to `~/.config/nvim/`.
4. Install packages using `:PackInstall`.
5. Run `:Mason` to check for language server installation.

Note: typescript-language-server, tailwindcss-language-servers requires Node version >= 14 in order to operate 
