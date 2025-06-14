return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      ["gopls"] = function(_, opts)
        opts.on_attach = function(client)
          client.server_capabilities.semanticTokensProvider = nil
        end
        return false
      end,
    },
  },
}
