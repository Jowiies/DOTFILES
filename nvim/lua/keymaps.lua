vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

-- LSP keymaps
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
end, {})

