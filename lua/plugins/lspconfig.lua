return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      gopls = function(_, opts)
        -- local ih = require("inlay-hints")
        -- require("lazyvim.util").lsp.on_attach(function(client, bufnr)
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "gopls" then
            -- ih.on_attach(client, bufnr)
            -- workaround to hl semanticTokens
            -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
            if not client.server_capabilities.semanticTokensProvider then
              local semantic = client.config.capabilities.textDocument.semanticTokens
              client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                  tokenTypes = semantic.tokenTypes,
                  tokenModifiers = semantic.tokenModifiers,
                },
                range = true,
              }
            end
          end
        end)
        opts.settings = {
          gopls = {
            semanticTokens = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        }
      end,
    },
  },
}
