-- ~/.config/nvim/lua/plugins/lsp-config.lua
return {
  {
    "williamboman/mason.nvim",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      -- Use new-style handler overrides
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
          border = "rounded",
          max_width = 80,
          max_height = 20,
        }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {
          border = "rounded",
          max_width = 80,
          max_height = 20,
        }
      )

      vim.diagnostic.config({
        float = {
          border = "rounded",
          max_width = 80,
          max_height = 20,
          focusable = false,
        },
        virtual_text = false, -- disable inline error text
        severity_sort = true, -- errors first
      })

      -- Floating window highlights
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Pmenu" })
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa", bg = "#1e1e2e" })

      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "jdtls",
          "lemminx",
          "jsonls",
          "yamlls",
          "bashls",
        },
        automatic_installation = true,
      })

      -- Common on_attach
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        -- Open diagnostic float on demand
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
      end

      -- Use new vim.lsp.config API (nvim 0.11+)
      vim.lsp.config('lua_ls', { on_attach = on_attach })
      vim.lsp.config('ts_ls', { on_attach = on_attach })
      vim.lsp.config('jdtls', { on_attach = on_attach })
      vim.lsp.config('lemminx', { on_attach = on_attach })
      vim.lsp.config('jsonls', { on_attach = on_attach })
      vim.lsp.config('yamlls', { on_attach = on_attach })
      vim.lsp.config('bashls', { on_attach = on_attach })
    end,
  },
}

