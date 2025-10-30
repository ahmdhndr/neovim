return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      timeout = 10000,
    },
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = {
            ".git", -- Excludes all content within .git directories
            "node_modules", -- Excludes all content within node_modules directories
            "*.log",
          },
        },
        explorer = {
          hidden = true,
          ignored = true,
          layout = {
            layout = {
              position = "right",
            },
          },
          exclude = {
            ".git", -- Excludes all content within .git directories
            "node_modules", -- Excludes all content within node_modules directories
            "*.log",
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>fh",
      function()
        require("snacks.picker").files({ hidden = true, ignored = true })
      end,
      desc = "Find hidden files",
    },
  },
}
