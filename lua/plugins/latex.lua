-- defines latex plugins, which don't fall in to any of the other categories
-- eg. besides the lsp (defined in lsp) and formatter

return {
  {
    "lervag/vimtex",
    ft = { "tex", "latex", "bib" },
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here
      if vim.fn.executable("zathura") == 1 then
        vim.g.vimtex_view_method = "zathura"
      else
        vim.g.vimtex_view_method = "skim"
      end
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },
}
