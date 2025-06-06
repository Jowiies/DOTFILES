return {
  {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
       
        -- Python LSP
        lspconfig.pyright.setup({})

        -- LSP server config
        lspconfig.clangd.setup({
            cmd = { "clangd","--background-index", "--clang-tidy"}
        })

        -- Diagnostic configuration
        -- Floating window
        vim.o.updatetime = 250
        vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
    end,
  }
}

