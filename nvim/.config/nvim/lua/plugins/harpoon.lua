return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Basic UI settings
    vim.keymap.set("n", "<C-a>", function()
      harpoon:list():add()
    end, { desc = "Harpoon Add File" })
    vim.keymap.set("n", "<C-b>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon Menu" })
    -- Removes the current file from the harpoon list
    vim.keymap.set("n", "<leader>mr", function()
      harpoon:list():remove()
    end, { desc = "Harpoon: Remove Current File" })
    -- Clears all files from the harpoon list
    vim.keymap.set("n", "<leader>mc", function()
      require("harpoon"):list():clear()
    end, { desc = "Harpoon: Clear All Marks" })
    -- Quick jumping to files 1-4
    vim.keymap.set("n", "<leader>m1", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>m2", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>m3", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>m4", function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-m>", function()
      harpoon:list():next()
    end)
  end,
}
