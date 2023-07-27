return {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  config = function()
    require('telescope').setup{
      defaults = {
        layout_config = {
          width = {padding=0},
          height = {padding=0} 
        }
      }
    }
  end,
  keys = {
    -- files and search
    {
      "<leader>ff",
      function() require'telescope.builtin'.git_files() end,
      desc = "Git files"
    },
    {
      "<leader>fF",
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