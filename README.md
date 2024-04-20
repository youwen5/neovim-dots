# 💤 Neovim Dotfiles

My Neovim configuration files, built on top of [LazyVim](https://github.com/LazyVim/LazyVim). Makes Neovim an actual usable IDE.

The main goal of this setup is to reach somewhat feature parity with VSCode's Intellisense features (in other words, to be _at least_ as productive as in VSCode).

## Installation

Ensure you have the latest version of Neovim installed, and remove or backup your existing settings.

```sh
rm -rf ~/.config/nvim
mv ~/.nvim ~/.nvim.bak
```

Then, clone this repository into where Neovim is expecting configuration files (usually `~/.config/nvim`).

```sh
git clone https://github.com/couscousdude/neovim-dots ~/.config/nvim
```

Launch Neovim and it should automatically setup `lazy.nvim` and install all plugins.

You can install LSPs for new languages by running `:MasonInstall <language>` and Treesitter parsers with `:TSInstall <language>`.

Set up Copilot with `:Copilot setup` and follow the instructions (or remove it by going to the LazyVim "Extras" section and uninstalling it. You can replace it with Codeium or Tab9).

Set up Wakatime with `:WakaTimeApiKey` (or uninstall it by removing its entry from `nvim/lua/plugins/extras.lua`).

Check the [LazyVim documentation](https://github.com/LazyVim/LazyVim) for more information on the rest of the features and plugins.

## Non-exhaustive list of changes on top of LazyVim

- More LSP configuration
  - `typescript-tools.nvim` to replace `typescript-language-server` from Mason, to reduce crashes and improve performance.
- `tailwind-fold` to fold long CSS classnames
- `vim-wakatime` to track time spent coding.
- Made background transparent and increased some colors to increase contrast (line numbers, etc).
- Add `presence.nvim` for Discord Rich Presence integration.
- Add Arch logo to the dashboard (page that initially opens if you type `nvim`) (did I mention I use Arch btw).
- Fix various annoyances with plugins:
  - Disable duplicate TS error reports from `tsserver` and `typescript-language-server`.
  - Rebind window resizing to use the `<alt>` key instead of `<ctrl>` because it conflicts with macOS window change shortcuts.
  - Configure notification plugin (`noice.nvim`) to suppress "No information available" when triggering hover (this is to prevent tailwind-language-server from showing this message on every hover when editing files containing both Tailwind and other languages with LSPs, such as `.svelte`).
- Move `neo-tree` to the right side of the screen by default (life changing).
