vim.cmd("set expandtab")
vim.cmd [[highlight Comment cterm=NONE gui=NONE]]
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_option("clipboard", "unnamed")
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_save_location = "~/.config/nvim/db_ui"
vim.keymap.set({"n", "t"}, "<leader>t", "<cmd>ToggleTerm<CR>", {desc = "Toggle terminal"})
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left split from terminal" })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right split from terminal" })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to bottom split from terminal" })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to top split from terminal" })
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl = vim.api.nvim_set_hl
    hl(0, "TelescopeNormal",       { bg = "none" })
    hl(0, "TelescopeBorder",       { bg = "none" })
    hl(0, "TelescopePromptNormal", { bg = "none" })
    hl(0, "TelescopePromptBorder", { bg = "none" })
    hl(0, "TelescopeResultsNormal", { bg = "none" })
    hl(0, "TelescopeResultsBorder", { bg = "none" })
  end,
})

