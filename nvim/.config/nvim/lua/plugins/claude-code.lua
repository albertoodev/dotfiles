return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    -- The command to launch Claude Code
    terminal_cmd = "claude",
  },
  keys = {
    {
      "<leader>og",
      function()
        Snacks.terminal.toggle("claude", {
          win = {
            position = "right",
            width = 0.35,
          },
        })
      end,
      desc = "Toggle Claude Chat (Right)",
    },
    {
      "<leader>oa",
      ":ClaudeCodeSend<cr>",
      mode = "v",
      desc = "Add Selection to Claude",
    },
  },
}
