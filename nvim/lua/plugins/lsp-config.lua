return {
  -- Mason: installs LSP servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Bridge between Mason and LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "intelephense",
          "pyright",
          "clangd",
        },
      })
    end,
  },

  -- TypeScript Tools (replaces tsserver)
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = "all",
        tsserver_plugins = {},
      },
    },
  },

  -- Main LSP Config (Neovim 0.11+ syntax)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Common on_attach function for all LSP servers
      local on_attach = function(_, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
      end

      -- === New standardized LSP setup ===

      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("pyright", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("rust_analyzer", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("intelephense", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          intelephense = {
            files = { maxSize = 5000000 },
            environment = { includePaths = { "/usr/include/php" } },
            diagnostics = { enable = true },
          },
        },
      })

      -- === Diagnostics ===
      vim.diagnostic.config({
        signs = false,
        virtual_text = true,
        underline = true,
        update_in_insert = false,
      })
    end,
  },
}

