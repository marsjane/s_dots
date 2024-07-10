return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "Shatur/neovim-ayu",
    mirage = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "ayu-mirage",
      -- colorscheme = "solarized-osaka",
      -- colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin-macchiato",
    },
  },
}
