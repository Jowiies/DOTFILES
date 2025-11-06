return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local esp32 = require("esp32")
      opts.servers = opts.servers or {}
      opts.servers.clangd = esp32.lsp_config()
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Python LSP
      vim.lsp.config("pyright", {})

      -- Golang LSP
      vim.lsp.config("gopls", {
          settings = {
              gopls = {
                  gofumpt = true,
                  staticcheck = true,
              },
          },
      })

      -- Clangd LSP
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy" }
      })
      vim.lsp.enable({"pyright", "clangd", "gopls" })

      vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function()
              vim.lsp.buf.format({ async = false })
          end,
      })
      -- Diagnostic configuration
      vim.o.updatetime = 250
      vim.cmd [[
        autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})
      ]]
    end,
  }
}

