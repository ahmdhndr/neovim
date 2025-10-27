return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    notify.setup()

    vim.keymap.set("n", "<leader>nn", function()
      notify.dismiss({ silent = true, pending = true })
    end, { desc = "Clear notifications" })

    -- override default notify vim
    vim.notify = notify
  end,
}
