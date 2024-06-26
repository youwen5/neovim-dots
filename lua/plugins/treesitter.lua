-- extends the treesitter configuration

return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline", "svelte", "rust", "haskell", "css" })
    end
  end,
}
