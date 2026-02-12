return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = false,
            accept_line = "<S-Tab>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = {
          enabled = false,
        },
      })
    end,
  },

  -- Copiloet Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      temperature = 0.1,
      window = {
        layout = "vertical",
        width = 0.4,
      },

      prompts = {
        Plan = {
          prompt = "/COPILOT_GENERATE \n> # Plan\n> Create a detailed step-by-step plan to implement the requested feature. Do not write code yet, just the plan.",
          description = "Agent: Plan Mode",
        },
        Agent = {
          prompt = "/COPILOT_EXPLAIN \n> # Agent\n> Analyze the workspace context and answer the query acting as a senior developer.",
          description = "Agent: General",
        },
      },

      selection = function(source)
        return require("CopilotChat.select").buffer(source)
      end,
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")

      chat.setup(opts)

      --  Keymaps
      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        local input = vim.fn.input("Ask Copilot: ")
        if input ~= "" then
          chat.ask(input, { selection = select.buffer })
        end
      end, { desc = "Ask Copilot (@this context)" })

      vim.keymap.set({ "n", "t" }, "<leader>og", function()
        chat.toggle()
      end, { desc = "Toggle Copilot Chat" })

      -- Visual selection context
      vim.keymap.set("x", "<leader>oi", function()
        chat.open({ selection = select.visual })
      end, { desc = "Copilot with Selection" })

      -- Current Line context
      vim.keymap.set("n", "<leader>ol", function()
        -- Custom selection for just the current line
        chat.open({
          selection = function(source)
            return select.visual(source) -- fallback trick, or write custom line logic
          end,
        })
      end, { desc = "Copilot with Current Line" })

      vim.keymap.set("n", "<leader>ou", function()
        chat.reset()
      end, { desc = "Reset/Clear Chat" })

      vim.keymap.set("n", "<leader>of", "<cmd>CopilotChatFix<cr>", { desc = "Auto Fix" })
    end,
  },
}
