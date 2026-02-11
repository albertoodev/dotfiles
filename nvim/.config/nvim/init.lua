-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- adding syntax highlight to jsonl files ...
vim.filetype.add({
  extension = {
    jsonl = "json",
  },
})

-- -- Main window transparency
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--
-- -- Floating window transparency (VimBeGood, Telescope, etc.)
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
