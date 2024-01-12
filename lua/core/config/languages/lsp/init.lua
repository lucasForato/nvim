local lua_ls = require("core.config.languages.lsp.lua_ls")

local servers = {
  "pyright",
  "jsonls",
  "lua_ls",
  "tsserver",
  "dockerls",
  "bashls",
}

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-lint",
    "rshkarin/mason-nvim-lint",
  },

  config = function()
    require("mason").setup({
      ensure_installed = {
        "shfmt"
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = servers,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end,

        ["lua_ls"] = lua_ls
      },
    })

    vim.diagnostic.config({
      update_in_insert = false,
      float = {
        source = "always",
        focusable = false,
        style = "minimal",
        border = "rounded",
        header = "",
        prefix = ""
      },
    })
  end,
}
