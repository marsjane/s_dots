return {
  "m4xshen/hardtime.nvim",
  -- event = 'VeryLazy',
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  keys = {
    { "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"' },
    { "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"' }
  },
  opts = {
    max_count = 100,
    disable_mouse = false,
    disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "neo-tree" },
  }
}
