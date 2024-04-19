-- stylua: ignore
--
-- defines configuration for formatters and cosmetic code enhancements (not including themes/pure cosmetic)

return {
  -- fold long tailwindcss classes
  {
    'razak17/tailwind-fold.nvim',
    opts= {},
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade' },
  },
}
