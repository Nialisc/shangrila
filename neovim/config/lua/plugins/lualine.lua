return {
  "nvim-lualine/lualine.nvim",
  name = "lualine",
  dependencies = { 
    "catppuccin/nvim",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    options = {
      theme = "catppuccin",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    }
  }
}
