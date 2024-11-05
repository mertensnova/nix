require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "c", "lua","typescript","python","go","cpp","html","goctl"},
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },

 
}

 vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
