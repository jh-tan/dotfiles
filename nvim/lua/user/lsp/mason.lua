local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "golangci_lint_ls",
  "gopls",
  "html",
  "jdtls",
  "jsonls",
  "ts_ls",
  "pyright",
  "clangd",
  "tailwindcss",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "jsonls" then
  end

  if server == "gopls" then
  end

  if server == "tsserver" then
  end

  if server == "pyright" then
  end

  if server == "clangd" then
  end

  if server == "tailwindcss" then
  end

  if server == "jdtls" then
  end

  lspconfig[server].setup(opts)
  ::continue::
end

