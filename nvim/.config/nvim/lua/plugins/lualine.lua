return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local function setup_hl()
      vim.api.nvim_set_hl(0, "LualineTmuxActive", { bg = "#cba6f7", fg = "#1e1e2e", bold = true })
    end
    setup_hl()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = setup_hl })

    local mode_to_lualine = {
      n = "normal",
      i = "insert",
      v = "visual",
      V = "visual",
      ["\22"] = "visual",
      c = "command",
      R = "replace",
    }

    local tmux_windows = function()
      if vim.env.TMUX == nil then
        return ""
      end
      local context = 2
      local result = vim.fn.system("tmux list-windows -F '#{window_index}|#{window_name}|#{window_active}'")
      local all, current_pos = {}, 1
      for line in result:gmatch("[^\n]+") do
        local idx, name, active = line:match("(%d+)|([^|]+)|(%d+)")
        if idx then
          table.insert(all, { idx = idx, name = name, active = active == "1" })
          if active == "1" then
            current_pos = #all
          end
        end
      end
      local first = math.max(1, current_pos - context)
      local last = math.min(#all, current_pos + context)
      local mode = mode_to_lualine[vim.fn.mode()] or "normal"
      local reset = "%#lualine_x_" .. mode .. "#"
      local parts = {}
      if first > 1 then
        table.insert(parts, "‹")
      end
      for i = first, last do
        local w = all[i]
        if w.active then
          table.insert(parts, "%#LualineTmuxActive# " .. w.idx .. " " .. w.name .. " " .. reset)
        else
          table.insert(parts, w.idx .. " " .. w.name)
        end
      end
      if last < #all then
        table.insert(parts, "›")
      end
      return table.concat(parts, "   ")
    end

    table.insert(opts.sections.lualine_x, 1, tmux_windows)
  end,
}
