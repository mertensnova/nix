require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "javascript", "typescript", "c", "lua", "rust","typescript","python","golang","go"},
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
        additional_vim_regex_highlighting = false,
  },
}

