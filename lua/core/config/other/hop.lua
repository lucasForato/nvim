return {
  'smoka7/hop.nvim',
  version = "v2",
  config = function()
    require('hop').setup({
      quit_key = ' ',
      case_insensitive = false,
      current_line_only = false,
    })
  end
}
