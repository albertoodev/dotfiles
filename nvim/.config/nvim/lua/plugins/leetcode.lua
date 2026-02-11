return {
  "albertoodev/leetcode.nvim",
  dir = "~/projects/leetcode.nvim",
  build = ":TSUpdate",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    arg = "leetcode.nvim",
    lang = "dart",
    directory = vim.fn.expand("$HOME") .. "/projects/leetcode",
    description = {
      position = "right",
    },
  },
}
