return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function ()
      require("neo-tree").setup({
        window = {
          mappings = {
            ['w'] = "none"
          }
        },
        filesystem = {
          filtered_items = {
            visible = true,
          }
        }
      })
    end,
    keys = {
      {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, reveal_force_cwd = true})
      end,
      desc = "Explorer NeoTree (cwd reveal)",
    },
    }
  }
}
