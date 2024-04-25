# Neovim Dotfiles

My Neovim configuration files, built on top of
[LazyVim](https://github.com/LazyVim/LazyVim). Makes Neovim an actual usable
IDE.

The main goal of this setup is to reach somewhat feature parity with VSCode's
Intellisense features (in other words, to be _at least_ as productive as in
VSCode). Since the majority of VS Code's "IntelliSense" features are really just
its wrapper around an LSP, almost all useful VS Code features (except maybe the
debugger) are also available in Neovim.

You probably shouldn't use these dotfiles, because you'd likely be better off
just installing LazyVim yourself and setting things up how you like. This is
mainly here as a personal backup, and to leave notes for my own use. But, I'll
try to document as much as I can, anyways.

## Installation

Ensure you have the latest version of Neovim installed, and remove or backup
your existing settings. Install `tree-sitter-cli` with either `cargo` or `npm`,
and ensure `npm` and `tree-sitter-cli` are on your `PATH`.

```sh
# remove it
rm -rf ~/.config/nvim

# or back it up, if you have settings you don't want to lose.
mv ~/.config/nvim ~/.config/nvim.bak

# with npm (or pnpm, bun, yarn)
npm install --global tree-sitter-cli

# with cargo
cargo install tree-sitter-cli
```

Then, clone this repository into where Neovim is expecting configuration files
(usually `~/.config/nvim`).

```bash
git clone https://github.com/couscousdude/neovim-dots ~/.config/nvim
```

Launch Neovim and it should automatically setup `lazy.nvim` and install all
plugins.

You can install LSPs for new languages by running `:MasonInstall <language>` and
Treesitter parsers with `:TSInstall <language>`.

Set up Copilot with `:Copilot setup` and follow the instructions (or remove it
by going to the LazyVim "Extras" section and uninstalling it. You can replace it
with Codeium or Tab9).

Set up Wakatime with `:WakaTimeApiKey` (or uninstall it by removing its entry
from `nvim/lua/plugins/extras.lua`).

Check the [LazyVim documentation](https://github.com/LazyVim/LazyVim) for more
information on the rest of the features and plugins.

## Notes

- Trouble v3 seems to be breaking in specific situations (esp. in Svelte) when
  used with the lua-line. I disabled it for now because statusline is more
  important and regular trouble.nvim seems to work fine. Maybe upgrading to
  neovim 0.10.x will help.

## Non-exhaustive list of changes on top of LazyVim

- More LSP configuration
  - `typescript-tools.nvim` to replace `typescript-language-server` from Mason,
    to reduce crashes and improve performance.
- `tailwind-fold` to fold long CSS classnames
- `vim-wakatime` to track time spent coding.
- Made background transparent and increased some colors to increase contrast
  (line numbers, etc).
- Add `presence.nvim` for Discord Rich Presence integration.
- Add Arch logo to the dashboard (page that initially opens if you type `nvim`)
  (did I mention I use Arch btw).
- Fix various annoyances with plugins:
  - Disable duplicate TS error reports from `tsserver` and
    `typescript-language-server`.
  - Rebind window resizing to use the `<alt>` key instead of `<ctrl>` because it
    conflicts with macOS window change shortcuts.
  - Configure notification plugin (`noice.nvim`) to suppress "No information
    available" when triggering hover (this is to prevent
    tailwind-language-server from showing this message on every hover when
    editing files containing both Tailwind and other languages with LSPs, such
    as `.svelte`).
- Move `neo-tree` to the right side of the screen by default (life changing).
- Add TeX support.
