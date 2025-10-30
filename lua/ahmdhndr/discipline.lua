local M = {}

function M.cowboy()
  ---@type table?
  local id
  local timers = {} -- Use a table to store timers for each key

  for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
    local count = 0
    local map = key

    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end

      -- Clear the previous timer if it exists for this key
      if timers[key] then
        timers[key]:stop()
      end

      if vim.v.count >= 10 then
        local ok
        ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
          icon = "🤠",
          replace = id,
          keep = function()
            return count >= 10
          end,
        })

        if not ok then
          id = nil
          return map
        end
      else
        count = count + 1
        -- Create a new timer and store it
        timers[key] = assert(vim.uv.new_timer())
        timers[key]:start(2000, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end
end

return M
