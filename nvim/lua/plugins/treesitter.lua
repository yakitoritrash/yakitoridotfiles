return { "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "javascript" },
    highlight = { enable = true },
    indent = { enable = true }
  })
  end

}
