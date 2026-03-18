return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      term_colors = true,
      styles = {
        functions = {},
        keywords = {},
        variables = {},
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "transparent", -- make telescope popup transparent
        },
        treesitter = true,
        cmp = true,
        gitsigns = true,
        lsp_trouble = true,
        which_key = true,
      },
    })
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
}

