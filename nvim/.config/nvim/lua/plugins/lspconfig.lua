return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      jsonls = {
        init_options = {
          provideFormatter = false,
        },
      },
    },
  },
}
