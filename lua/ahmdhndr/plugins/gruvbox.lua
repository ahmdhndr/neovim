return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme gruvbox]])
  end,
  opts = {
    terminal_colors = true,
    undercurl = true,
    underline = true,
    inverse = true,
    dim_inactive = true,
    transparent_mode = true
  }
}
