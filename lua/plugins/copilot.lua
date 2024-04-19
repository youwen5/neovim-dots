return {
  {
    "zbirenbaum/copilot.lua",
    opts = function(_, opts)
      table.insert(opts.filetypes, { markdown = false })
    end,
  },
}
