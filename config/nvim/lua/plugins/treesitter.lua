return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.install").prefer_git = true
      require("nvim-treesitter.configs").setup({
        prefer_git = true,
        ensure_installed = {
          "vim",
          "vimdoc",
          "bash",
          "c",
          "cpp",
          "javascript",
          "json",
          "lua",
          "python",
          "typescript",
          "tsx",
          "css",
          "rust",
          "markdown",
          "markdown_inline",
          "query",
        }, -- one of "all" or a list of languages
      })
    end,
  },
}
