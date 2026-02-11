-- override snacks to show hide .gitignore files and .files
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = false,
        },
      },
    },
  },
}
