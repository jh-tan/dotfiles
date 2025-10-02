return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "basedpyright",
          "bashls",
          "clangd",
          "cssls",
          "gopls",
          "html",
          "lua_ls",
          "tailwindcss",
          "ts_ls",
        },
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "codelldb",
          "biome",
          "clang-format",
          "cmakelang",
          "goimports",
          "prettier",
          "ruff",
          "shfmt",
          "stylua",
          "shellcheck",
        },
        auto_update = true,
      })
    end,
  }
}
