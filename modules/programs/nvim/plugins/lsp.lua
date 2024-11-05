local lspconfig = require('lspconfig')
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
 local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end,
})

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.gopls.setup{
  capabilities = capabilities,
}
lspconfig.templ.setup{
  capabilities = capabilities,
}
lspconfig.nixd.setup{
  capabilities = capabilities,
}
lspconfig.clangd.setup{
  capabilities = capabilities,
}
lspconfig.html.setup {
  capabilities = capabilities,
}
lspconfig.ts_ls.setup{
  capabilities = capabilities,
}

