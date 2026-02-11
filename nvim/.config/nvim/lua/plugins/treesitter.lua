return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      "python",
      "tsx",
      "typescript",
      "json",
    })
    opts.indent = opts.indent or {}
    opts.indent.enable = true
    opts.indent.disable = opts.indent.disable or {}
    table.insert(opts.indent.disable, "json")
    opts.matchup = {
      enable = true,
    }
  end,
}
