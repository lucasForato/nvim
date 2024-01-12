local treesitter = require("core.config.interface.treesitter")
local lualine = require("core.config.interface.lualine")
local nvimtree = require("core.config.interface.nvim-tree")
local whichkey = require("core.config.interface.whichkey")
local bufferline = require("core.config.interface.bufferline")
local dressing = require("core.config.interface.dressing")

local gruvbox = require("core.config.themes.gruvbox")
local catppuccin = require("core.config.themes.catppuccin")
local tokyonight = require("core.config.themes.tokyonight")
local spectre = require("core.config.languages.spectre")

local telescope = require("core.config.languages.telescope")
local cmp = require("core.config.languages.cmp")
local lsp = require("core.config.languages.lsp")
local copilot = require("core.config.languages.copilot")
local autopairs = require("core.config.languages.autopairs")
local conform = require("core.config.languages.conform")
local trouble = require("core.config.languages.trouble")
local toggleterm = require("core.config.other.toggleterm")
local harpoon = require("core.config.other.harpoon")
local comment = require("core.config.other.comment")
local gitsigns = require("core.config.other.gitsigns")
local hop = require("core.config.other.hop")
local fidget = require("core.config.other.fidget")


local plugins = {

  ----------------------------------------
  -- Interface
  ----------------------------------------

  lualine,
  nvimtree,
  whichkey,
  bufferline,
  dressing,

  ----------------------------------------
  -- Themes
  ----------------------------------------

  gruvbox,
  catppuccin,
  tokyonight,

  ----------------------------------------
  -- Language
  ----------------------------------------

  telescope,
  cmp,
  lsp,
  treesitter,
  copilot,
  autopairs,
  conform,
  trouble,
  spectre,

  ----------------------------------------
  -- Other
  ----------------------------------------

  toggleterm,
  harpoon,
  comment,
  gitsigns,
  hop,
  fidget
}

-------------------------------------------------------------------------------
-- Plugin manager configuration
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
-- Plugin manager setup
-------------------------------------------------------------------------------

require("lazy").setup(plugins)
