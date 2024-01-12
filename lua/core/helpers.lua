local M = {}

function M.map(mode, keys, cmd, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, keys, cmd, options)
end

M.icons = {
	Copilot = "",
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}

function M.trim(s)
	return s:match("^%s*(.-)%s*$")
end

function M.diagnostic()
	local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	if #errors > 0 then
		return "ERROR"
	end

	local warns = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	if #warns > 0 then
		return "WARN"
	end

	local infos = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	if #infos > 0 then
		return "INFO"
	end

	local hints = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	if #hints > 0 then
		return "HINT"
	end
end

function M.highlight()
  local diag = M.diagnostic()

  if (diag == "ERROR") then
    return "Error"
  end

  if (diag == "INFO") then
    return "Info"
  end

  if (diag == "WARN") then
    return "Warn"
  end

  if (diag == "HINT") then
    return "Hint"
  end

  return "NeoTreeFileName"
end

return M
