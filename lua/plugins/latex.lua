-- defines latex plugins, EXCEPT the lsp (defined in lsp.)

return {
  {
    "lervag/vimtex",
    ft = { "tex", "latex", "bib" },
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here
      vim.g.vimtex_view_method = "skim"
    end,
  },
}
