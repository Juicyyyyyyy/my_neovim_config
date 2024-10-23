-- Set leader key
vim.g.mapleader = " "

-- Unmap space in normal and visual modes to prevent it from moving the cursor
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Bootstrap lazy.nvim and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from plugins/init.lua
local plugins = require("plugins.init")

-- Setup lazy.nvim with the imported plugins
require("lazy").setup(plugins)

-- Load Neovim options (create your own options module)
require("options")

-- Load key mappings (create your own mappings module)
vim.schedule(function()
  require("mappings")
end)
