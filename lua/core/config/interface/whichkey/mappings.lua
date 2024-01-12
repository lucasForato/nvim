--------------------------------------------------------------------------------
-- Define whichkey mappings and options
--------------------------------------------------------------------------------

local mappings = {

  -- Buffers
  ["<"] = { "Previous Buffer" },
  [">"] = { "Next Buffer" },
  ["w"] = { "Close Buffer" },

  ["e"] = { "Explorer" },

  ["s"] = { "Hop" },
  ["<leader>s"] = { "Hop back" },

  -- Harpoon
  ["h"] = {
    name = "Harpoon",
    ["a"] = { "Append to Harpoon List" },
    ["d"] = { "Delete from Harpoon List" },
    ["h"] = { "Toggle Harpoon" }
  },

  ["f"] = {
    name = "File",
    f = { "Find File" },
    g = { "Find Git File"},
    s = { "Save File" },
    m = { "Format File" },
    r = { "Previous Search" }
  },

  ["t"] = {
    name = "Toggle",
    b = { "Toggle Git Blame" },
    t = { "Toggle Trouble" },
    g = { "Toggle Lazygit" },
    e = { "Toggle Explorer" },
    r = { "Toggle Refactor" }
  },

  ["c"] = {
    name = "Code",
    a = { "Code Action" },
    h = { "Code Signature Help" },
    r = { "Code Rename" },
    f = { "Code Floating Diagnostics" },
 },

  ["g"] = {
    name = "Go to",
    d = { "Go to Definition" },
    r = { "Go to References" },
  },

  ["/"] = { "Toggle Comment" },

}

--------------------------------------------------------------------------------
-- Use the options
--------------------------------------------------------------------------------
local opts = { prefix = "<leader>", noremap = true, silent = true }
local wk = require("which-key")
wk.register(mappings, opts)
