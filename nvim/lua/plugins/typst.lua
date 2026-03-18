return {
  {
    "kaarmu/typst.vim",
    ft = "typst",
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    build = function()
      require("typst-preview").update()
    end,
    config = function()
      require("typst-preview").setup({
        open_cmd = "zen-browser", -- or "firefox", "brave", etc.
        output = "server",        -- enables localhost web preview
        port = 6968,
        get_root = function(path)
          return vim.fn.getcwd()  -- ensure it's using current dir
        end,
        watch_dir = ".",          -- recompile when file changes
      })
    end,
  },
}

