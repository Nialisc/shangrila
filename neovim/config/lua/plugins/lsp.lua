return {
  {
    "williamboman/mason.nvim",
    event = "BufEnter",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufEnter",
    opts = {
      -- install specific ls
      ensure_installed = { "lua_ls" }
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    config = function()
      local lspconfig = require("lspconfig")

      -- init those ls
      lspconfig.lua_ls.setup({})

      -- key mappings
      vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
    end
  }
}
