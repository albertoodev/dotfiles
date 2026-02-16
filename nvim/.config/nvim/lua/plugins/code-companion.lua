return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "zbirenbaum/copilot.lua",
  },
  opts = {
    strategies = {
      chat = { adapter = "copilot" },
      inline = { adapter = "copilot" },
      agent = { adapter = "copilot" },
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "auto",
            },
          },
        })
      end,
    },
    display = {
      chat = {
        window = {
          layout = "vertical",
          width = 0.4,
        },
      },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)

    local cc = require("codecompanion")

    vim.keymap.set({ "n", "t" }, "<leader>og", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle Chat" })
    vim.keymap.set({ "n", "v" }, "<leader>of", "<cmd>CodeCompanion /fix<cr>", { desc = "Auto Fix (Diff)" })
    vim.keymap.set("n", "<leader>ou", "<cmd>CodeCompanionChat Reset<cr>", { desc = "Reset Chat" })

    vim.keymap.set({ "n", "v" }, "<leader>oa", function()
      vim.ui.input({ prompt = "Ask Copilot: " }, function(input)
        if input and input ~= "" then
          cc.chat({ messages = { { role = "user", content = input } } })
        end
      end)
    end, { desc = "Ask Copilot" })

    vim.keymap.set("v", "<leader>oi", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add Selection to Chat" })
  end,
}
