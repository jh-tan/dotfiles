local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
  if server.name == "clangd" then
  end

  if server.name == "tsserver" then
    local ts_opts = require "user.lsp.settings.ts-config"
    opts = vim.tbl_deep_extend("force", ts_opts, opts)
  end

  if server.name == "pyright" then
  end

  if server.name == "gopls" then
  end

  if server.name == "pyright" then
  end

  if server.name == "jsonls" then
  end

  if server.name == "tailwindcss" then
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
