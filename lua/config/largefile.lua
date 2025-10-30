-- disable beberapa plugin / fitur untuk file besar
vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
  callback = function(args)
    local ok, stats = pcall(vim.loop.fs_stat, args.file)
    if ok and stats and stats.size > 1024 * 1024 then -- > 1 MB
      vim.b.large_file = true
      vim.cmd("syntax off")
      vim.cmd("setlocal noswapfile noundofile nobackup nowritebackup")
      vim.cmd("setlocal foldmethod=manual")
      vim.cmd("setlocal noundofile")
      vim.opt_local.wrap = false
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.foldenable = false

      -- matiin treesitter
      pcall(vim.cmd, "TSBufDisable highlight")
      pcall(vim.cmd, "TSBufDisable indent")

      -- matiin LSP
      for _, client in pairs(vim.lsp.get_clients()) do
        vim.lsp.stop_client(client.id)
      end

      vim.notify("Large file detected (>1MB): activate optimized performance mode ⚡", vim.log.levels.INFO)
    end
  end,
})
