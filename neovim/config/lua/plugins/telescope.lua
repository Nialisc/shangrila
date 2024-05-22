return {
  "nvim-telescope/telescope.nvim", tag = '0.1.5',
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  lazy = true,
  opts = {
    defaults = {
      layout_config = {
        width = {padding=0},
        height = {padding=0} 
      }
    }
  },
  keys = {
    -- files and search
    {
      "<leader>fF",
      function() require'telescope.builtin'.git_files() end,
      desc = "Git files"
    },
    {
      "<C-p>",
      function() require'telescope.builtin'.find_files() end,
      desc = "Files"
    },
    {
      "<leader>S",
      function() require'telescope.builtin'.grep_string() end,
      desc = "Search term"
    },
    {
      "<leader>s",
      function() require'telescope.builtin'.live_grep() end,
      desc = "Live search"
    },
    -- buffers
    {
      "<leader>b",
      function() require'telescope.builtin'.buffers() end,
      desc = "List buffers"
    }
  },
}
