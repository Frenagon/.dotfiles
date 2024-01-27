return {
  {
    "navarasu/onedark.nvim",
    opts = {
      colors = {
        purple = "#C678DD",
        green = "#98C379",
        orange = "#D19A66",
        blue = "#61AFEF",
        yellow = "#E5C07B",
        cyan = "#65B6C2",
        red = "#E06C75",
        grey = "#5c6370",
      },
      highlights = {
        ["@lsp.typemod.variable.readonly"] = { fg = "$orange" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        mode = "virtualtext",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
}
