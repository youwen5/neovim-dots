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
}
