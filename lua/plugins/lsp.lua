return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, values)
      table.insert(values.diagnostics, {
        update_in_insert = false,
      })
    end,
  },
}
