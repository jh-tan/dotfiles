local options = {
  clipboard = "unnamedplus",               
  syntax = "on",   
  errorbells = false,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smarttab = true,
  autoindent = true,
  smartindent = true,
  number = true,
  relativenumber = true,
  wrap = false,
  smartcase = true,
  ignorecase = true,
  incsearch = true,
  scrolloff = 8,
  signcolumn = "yes",  
  backspace = "indent,eol,start",
  background = "dark",
  showmode = false,
  hidden = true,
  timeout = true,
  ttimeout = true,
  timeoutlen = 3000,
  ttimeoutlen=50,
  undofile = true,
  updatetime = 300
}

vim.opt.sessionoptions = vim.opt.sessionoptions + "globals"
vim.g.skip_ts_context_commentstring = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

for k, v in pairs(options) do
  vim.opt[k] = v
end
