return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/obsidian/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/obsidian",
      },
    },

    -- Daily notes go in the root (matches your existing date-named files)
    daily_notes = {
      folder = ".",
      date_format = "%Y-%m-%d",
    },

    -- New notes land in inbox/
    notes_subdir = "inbox",

    -- Note ID is just the filename you give it
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,

    -- Use snacks.nvim picker (already in your setup)
    picker = {
      name = "snacks",
    },

    -- Render markdown decorations in normal mode
    ui = {
      enable = true,
    },

    attachments = {
      img_folder = "inbox/assets",
    },
  },

  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian app" },
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Today's daily note" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Links in note" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Search by tag" },
    { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Rename note" },
    { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste image" },
  },
}
