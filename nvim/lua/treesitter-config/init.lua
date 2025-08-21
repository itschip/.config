require('nvim-treesitter.configs').setup({
  ensure_installed = { 'javascript', 'typescript', 'go', 'lua' },
  auto_install = true,
  highlight = {
    enable = true
  }
})
