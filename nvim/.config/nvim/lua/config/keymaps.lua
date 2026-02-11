-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
vim.opt.digraph = false
--  Split
map("n", "<leader>v", "<cmd>split<cr>", { desc = "Split Right" })
map("n", "<leader>h", "<cmd>vsplit<cr>", { desc = "Split Down" })
-- Switch buffers
map("n", "<leader><tab>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Move in insert mode
map("i", "<C-l>", "<Right>", { desc = "Move right in insert mode" })
map("i", "<C-h>", "<Left>", { desc = "Move left in insert mode" })

map("i", "<A-a>", "<Esc>A", { desc = "Append at end of line" })

map("i", "<A-o>", "<Esc>o", { desc = "New line below" })

-- Adb wireless pairign via qr code
map("n", "<leader>ap", function()
  LazyVim.terminal({ "adb-wifi" }, {
    desc = "ADB Wireless Pair (QR)",
    esc_esc = false,
    ctrl_hjkl = false,
  })
end, { desc = "ADB Wireless Pair (QR)" })
