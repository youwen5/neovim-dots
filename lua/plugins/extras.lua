-- stylua: ignore
-- defines extra plugins that don't directly affect editing

return {
  {
    "andweeb/presence.nvim",
    lazy=false,
    opts = {
      workspace_text = "The One True Text Editor",
      editing_text = "Hacking %s",
    },
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
}
