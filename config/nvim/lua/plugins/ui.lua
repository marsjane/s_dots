return {
  -- messages, cmdline and the popupmenu
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 6000,
    },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      -- https://patorjk.com/software/taag/?ref=devas.life#p=display&f=ANSI%20Shadow&t=devaslife
      local logo = [[
  ██████╗██╗   ██╗██╗ ██████╗██╗   ██╗██╗███████╗██╗  ██╗ █████╗
  ██╔════╝██║   ██║██║██╔════╝██║   ██║██║██╔════╝██║  ██║██╔══██╗
  ██║     ██║   ██║██║██║     ██║   ██║██║███████╗███████║███████║
  ██║     ██║   ██║██║██║     ██║   ██║██║╚════██║██╔══██║██╔══██║
  ╚██████╗╚██████╔╝██║╚██████╗╚██████╔╝██║███████║██║  ██║██║  ██║
   ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚═════╝ ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝
        ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
