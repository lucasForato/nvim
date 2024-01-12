-------------------------------------------------------------------------------
-- Neovim Mappings
-------------------------------------------------------------------------------
local h = require("core.helpers")
local fidget = require("fidget")
local harpoon = require("harpoon")
local hop = require('hop')
local directions = require('hop.hint').HintDirection

-------------------------------------------------------------------------------
-- Toggle
-------------------------------------------------------------------------------

-- Toggle git blame
h.map("n", "<leader>tb", function()
  vim.cmd(":Gitsigns blame_line")
  fidget.notify("Toggled Git Blame", vim.log.levels.SUCESS)
end)

-- Toggle lazy git
h.map("n", "<leader>tg", ":lua Toggle_lazygit()<CR>")

-- Toggle explorer
h.map("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Toggle comments in normal mode
h.map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)

-- Toggle comments in visual mode
h.map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- Toggle trouble
h.map("n", "<leader>tt", ":TroubleToggle<cr>")

-- Toggle Harpoon
h.map("n", "<leader>hh", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

------------------------------------------------------------------------------
-- Controlling files ands buffers
-------------------------------------------------------------------------------

-- Save file
h.map("n", "<leader>fs", function()
  vim.cmd(":w!")
  fidget.notify("Saved file", vim.log.levels.SUCCESS)
end)

-- Save and close file
h.map("n", "<leader>w", function()
  vim.cmd(":w")
  vim.cmd(":bdelete!")
  fidget.notify("Saved file", vim.log.levels.SUCCESS)
end)

-- Close file
h.map("n", "<leader>x", ":bdelete!<cr>")

-- Buffers
h.map({ "n", "v" }, "<leader>,", ":BufferLineCyclePrev<cr>")
h.map({ "n", "v" }, "<leader>.", ":BufferLineCycleNext<cr>")

-- Append file to harpoon list
h.map("n", "<leader>ha", function()
  harpoon:list():append()
  fidget.notify("Appended to Harpoon list", vim.log.levels.SUCCESS)
end)

-------------------------------------------------------------------------------
-- Searching
-------------------------------------------------------------------------------

-- Telescope
local builtin = require("telescope.builtin")
h.map("n", "<leader>ff", builtin.find_files)
h.map("n", "<leader>fg", builtin.git_files)
h.map("n", "<leader>fw", builtin.live_grep)
h.map("n", "<leader>fr", builtin.resume)

-------------------------------------------------------------------------------
-- Coding utilities
-------------------------------------------------------------------------------

-- Indentation
h.map("v", "<", "<gv")
h.map("v", ">", ">gv")

-- Diagnostics
h.map("n", "<leader>cf", function()
  vim.diagnostic.open_float({ border = "rounded" })
end)

-- Moving Highlighting text
h.map("v", "J", ":m '>+1<CR>gv=gv")
h.map("v", "K", ":m '<-2<CR>gv=gv")

-- Maintain cursor in the center when going to next
h.map("n", "n", "nzzzv")
h.map("n", "N", "Nzzzv")

-- Formatting 
h.map("n", "<leader>fm", function()
  require("conform").format()
end)

-- Better undo
h.map("n", "U", ":redo<CR>")

-- Hop
vim.keymap.set('', 's', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', '<leader>s', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, {remap=true})

-- Refactor
vim.keymap.set('n', '<leader>tr', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
